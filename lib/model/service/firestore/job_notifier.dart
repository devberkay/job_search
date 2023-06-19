import 'dart:async';

import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final lastJobDocProvider = StateProvider<DocumentSnapshot?>((ref) {
  return null;
});

final jobNotifierProvider = AsyncNotifierProvider.autoDispose<JobNotifier,List<JobModel>? >(JobNotifier.new);

class JobNotifier extends AsyncNotifier<List<JobModel>?> {
  @override
  FutureOr<List<JobModel>?> build() async {
    final firestore = ref.watch(firestoreProvider);
    final collectionRef = firestore.collection("jobPosts");
    final lastJobDoc = ref.watch(lastJobDocProvider);
    if (lastJobDoc != null) {
      final query =
          await collectionRef.startAfterDocument(lastJobDoc).limit(15).get();
      final jobModels = query.docs.map((e) {
        return JobModel.fromJson(e.data());
      }).toList();
      ref.read(lastJobDocProvider.notifier).state = query.docs.last;
      return jobModels;
    } else {
      final query = await collectionRef.limit(15).get();
      final jobModels = query.docs.map((e) {
        return JobModel.fromJson(e.data());
      }).toList();
      ref.read(lastJobDocProvider.notifier).state = query.docs.last;
      return jobModels;
    }
  }
}
