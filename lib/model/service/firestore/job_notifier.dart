import 'dart:async';

import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final lastJobDocProvider = StateProvider<DocumentSnapshot?>((ref) {
  return null;
});

class JobNotifier extends AsyncNotifier<List<JobModel>?> {
  @override
  FutureOr<List<JobModel>?> build() {
    final firestore = ref.watch(firestoreProvider);
    final collectionRef = firestore.collection("jobPosts");
    final lastJobDoc = ref.watch(lastJobDocProvider);
    if(lastJobDoc!=null) {
      collectionRef.startAfterDocument(lastJobDoc);
    }
    else {
      collectionRef.
    }
  }
}
