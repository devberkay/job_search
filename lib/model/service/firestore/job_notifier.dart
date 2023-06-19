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
      List<JobModel> jobModels;
      for (var doc in query.docs) {
        final docId = doc.id;
        final minimumQualificationsCollectionRef =
            firestore.collection("jobPosts/$docId/minimumQualifications");
        final preferredQualificationsCollectionRef =
            firestore.collection("jobPosts/$docId/preferredQualifications");
        final responsibilitiesCollectionRef =
            firestore.collection("jobPosts/$docId/responsibilities");
        final qualificationsAndResponsibilities = await Future.wait([
          minimumQualificationsCollectionRef.get(),
          preferredQualificationsCollectionRef.get(),
          responsibilitiesCollectionRef.get()
        ], eagerError: true);
        final minimumQualifications = qualificationsAndResponsibilities[0]
            .docs
            .map((e) => (e.data()["qualifications"] as List<String>).join(" "))
            .toList();
        final preferredQualifications = qualificationsAndResponsibilities[1]
            .docs
            .map((e) => (e.data()["qualifications"] as List<String>).join(" "))
            .toList();
        final responsibilities = qualificationsAndResponsibilities[2]
            .docs
            .map((e) => (e.data()["qualifications"] as List<String>).join(" "))
            .toList();
        jobModels = query.docs.map((e) {
        return JobModel.fromJson(e.data()).copyWith(jobId: e.id);
        }).toList();
      }

      
      ref.read(lastJobDocProvider.notifier).state = query.docs.last;
      // debugPrint("jobModels : $jobModels");
      return jobModels;
    } else {
      debugPrint("jobNotifier-2");
      final query = await collectionRef.limit(15).get();
      debugPrint("jobNotifier-3");
      final jobModels = query.docs.map((e) {
        return JobModel.fromJson(e.data()).copyWith(jobId: e.id);
      }).toList();
      debugPrint("jobNotifier-4");
      ref.read(lastJobDocProvider.notifier).state = query.docs.last;
      debugPrint("jobModels : $jobModels");
      return jobModels;
    }
  }
}
