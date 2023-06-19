import 'dart:async';

import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';



class JobNotifier extends AsyncNotifier<List<JobModel>?> {
  @override
  FutureOr<List<JobModel>?> build() {
    final firestore = ref.read(firestoreProvider);
    final collectionRef = firestore.collection("jobPosts");
    
  }
}
