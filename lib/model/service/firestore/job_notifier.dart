import 'dart:async';

import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final lastJobDocProvider = StateProvider<DocumentSnapshot?>((ref) {
  return null;
});

final jobNotifierProvider =
    AsyncNotifierProvider.autoDispose<JobNotifier, List<JobModel>?>(
        JobNotifier.new);

class JobNotifier extends AutoDisposeAsyncNotifier<List<JobModel>?> {
  @override
  FutureOr<List<JobModel>?> build() async {
    final firestore = ref.watch(firestoreProvider);
    final collectionRef = firestore.collection("jobPosts");
    final lastJobDoc = ref.read(lastJobDocProvider);
    if (lastJobDoc != null) {
      debugPrint("jobNotifier-0");
      final query =
          await collectionRef.startAfterDocument(lastJobDoc).limit(15).get();
      debugPrint("jobNotifier-1");
      List<JobModel> jobModels = [];
      List<Future<QuerySnapshot<Map<String, dynamic>>>> qualificationsFutures =
          [];
      for (var doc in query.docs) {
        final docId = doc.id;
        final minimumQualificationsCollectionRef =
            firestore.collection("jobPosts/$docId/minimumQualifications");
        final preferredQualificationsCollectionRef =
            firestore.collection("jobPosts/$docId/preferredQualifications");
        final responsibilitiesCollectionRef =
            firestore.collection("jobPosts/$docId/responsibilities");
        qualificationsFutures.addAll([
          minimumQualificationsCollectionRef.get(),
          preferredQualificationsCollectionRef.get(),
          responsibilitiesCollectionRef.get()
        ]);
      }
      debugPrint("jobNotifier-2");
      final compoundData = await Future.wait(qualificationsFutures);
      debugPrint("jobNotifier-3");
      for (var i = 0; i < query.docs.length; i++) {
        final doc = query.docs[i];
        final docId = doc.id;
        final minimumQualificationsQuery = compoundData[i * 3];
        final preferredQualificationsQuery = compoundData[i * 3 + 1];
        final responsibilitiesQuery = compoundData[i * 3 + 2];
        final minimumQualifications = minimumQualificationsQuery.docs
            .map((e) => (e.data()["qualifications"] as List<String>).join(" "))
            .toList();
        final preferredQualifications = preferredQualificationsQuery.docs
            .map((e) => (e.data()["qualifications"] as List<String>).join(" "))
            .toList();
        final responsibilities = responsibilitiesQuery.docs
            .map((e) => (e.data()["qualifications"] as List<String>).join(" "))
            .toList();
        jobModels.add(JobModel.fromJson(doc.data()).copyWith(
            jobId: docId,
            minimumQualifications: minimumQualifications,
            preferredQualifications: preferredQualifications,
            responsibilities: responsibilities));
      }
      debugPrint("jobNotifier-4");
      ref.read(lastJobDocProvider.notifier).state = query.docs.last;
      debugPrint("jobModels-above : $jobModels");
      return jobModels;
    } else {
      final query = await collectionRef.limit(15).get();
      debugPrint("jobNotifier-5");
      List<JobModel> jobModels = [];
      List<Future<QuerySnapshot<Map<String, dynamic>>>> qualificationsFutures =
          [];
      for (var doc in query.docs) {
        final docId = doc.id;
        final minimumQualificationsCollectionRef =
            firestore.collection("jobPosts/$docId/minimumQualifications");
        final preferredQualificationsCollectionRef =
            firestore.collection("jobPosts/$docId/preferredQualifications");
        final responsibilitiesCollectionRef =
            firestore.collection("jobPosts/$docId/responsibilities");
        qualificationsFutures.addAll([
          minimumQualificationsCollectionRef.get(),
          preferredQualificationsCollectionRef.get(),
          responsibilitiesCollectionRef.get()
        ]);
      }
      final compoundData = await Future.wait(qualificationsFutures);
      debugPrint("jobNotifier-6");
      for (var i = 0; i < query.docs.length; i++) {
        final doc = query.docs[i];
        final docId = doc.id;
        final minimumQualificationsQuery = compoundData[i * 3];
        final preferredQualificationsQuery = compoundData[i * 3 + 1];
        final responsibilitiesQuery = compoundData[i * 3 + 2];
        debugPrint("jobNotifier-7");
        final minimumQualifications = minimumQualificationsQuery.docs
            .map((e) => (e.data()["qualifications"] as List<String>).join(" "))
            .toList();
        final preferredQualifications = preferredQualificationsQuery.docs
            .map((e) => (e.data()["qualifications"] as List<String>).join(" "))
            .toList();
        final responsibilities = responsibilitiesQuery.docs
            .map((e) => (e.data()["qualifications"] as List<String>).join(" "))
            .toList();
        debugPrint("jobNotifier-8");
        jobModels.add(JobModel.fromJson(doc.data()).copyWith(
            jobId: docId,
            minimumQualifications: minimumQualifications,
            preferredQualifications: preferredQualifications,
            responsibilities: responsibilities));
      }
      debugPrint("jobNotifier-9");
      ref.read(lastJobDocProvider.notifier).state = query.docs.last;
      debugPrint("jobModels-below : $jobModels");
      return jobModels;
    }
  }
}
