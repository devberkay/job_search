import 'dart:async';

import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final orderByProvider = StateProvider<String?>((ref) {
  return null;
});

final whatDoYouWantToDoListProvider = StateProvider<List<String>>((ref) {
  return [];
});

final skillsListProvider = StateProvider<List<String>>((ref) {
  return [];
});

final degreesSetProvider = StateProvider<Set<String>>((ref) {
  return {};
});

final jobTypesSetProvider = StateProvider<Set<String>>((ref) {
  return {};
});

final isRemoteEligibleProvider = StateProvider<bool>((ref) {
  return false;
});

final lastJobDocProvider = StateProvider<DocumentSnapshot?>((ref) {
  return null;
});

final jobNotifierProvider =
    AsyncNotifierProvider.autoDispose<JobNotifier, List<JobModel>?>(
        JobNotifier.new);

class JobNotifier extends AutoDisposeAsyncNotifier<List<JobModel>?> {
  @override
  FutureOr<List<JobModel>?> build() async {
    final orderBy = ref.watch(orderByProvider);
    final whatDoYouWantToDoFilterList = ref
        .watch(whatDoYouWantToDoListProvider)
        .expand((element) => [
              element,
              element.toLowerCase(),
              element[0].toUpperCase() + element.substring(1)
            ])
        .toList();
    final skillsFilterList = ref
        .watch(skillsListProvider)
        .expand((element) => [
              element,
              element.toLowerCase(),
              element[0].toUpperCase() + element.substring(1)
            ])
        .toList();
    final degreesFilterSet = ref.watch(degreesSetProvider);
    final jobTypesFilterSet = ref.watch(jobTypesSetProvider);
    final isRemoteEligibleFilter = ref.watch(isRemoteEligibleProvider);
    final filters = Filter.and(
        Filter("degree", whereIn: degreesFilterSet.toList()),
        Filter("isRemote", isEqualTo: isRemoteEligibleFilter),
        Filter("jobType", whereIn: jobTypesFilterSet.toList()),
        Filter("searchTokens",
            arrayContainsAny: [...whatDoYouWantToDoFilterList,...skillsFilterList])
        );
    final firestore = ref.watch(firestoreProvider);
    var collectionRef = firestore.collection("jobPosts");
    final lastJobDoc = ref.read(lastJobDocProvider);
    if (lastJobDoc != null) {
      debugPrint("jobNotifier-0");
      if (whatDoYouWantToDoFilterList.isNotEmpty) {}
      final snapshot =
          await collectionRef.startAfterDocument(lastJobDoc).where(filters).limit(15).get();
      debugPrint("jobNotifier-1");
      final jobModels = snapshot.docs.map((e) {
        return JobModel.fromJson(e.data()).copyWith(jobId: e.id);
      }).toList();
      ref.read(lastJobDocProvider.notifier).state = snapshot.docs.last;
      // debugPrint("jobModels : $jobModels");
      return jobModels;
    } else {
      debugPrint("jobNotifier-2");

      final snapshot = await collectionRef.where(filters).limit(15).get();
      debugPrint("jobNotifier-3");
      final jobModels = snapshot.docs.map((e) {
        return JobModel.fromJson(e.data()).copyWith(jobId: e.id);
      }).toList();
      debugPrint("jobNotifier-4");
      ref.read(lastJobDocProvider.notifier).state = snapshot.docs.last;
      debugPrint("jobModels : $jobModels");
      return jobModels;
    }
  }
}
