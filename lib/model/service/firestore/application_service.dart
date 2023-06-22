import 'dart:async';

import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ApplicatioNServiceNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> applyJob({required String jobId}) async {
    final firestore = ref.read(firestoreProvider);
    final applicationCollectionRef = firestore.collection('applications');
    final jobPostsCollectionDocRef =
        firestore.collection('jobPosts').doc(jobId);
    final jobPostQuery = await jobPostsCollectionDocRef.get();
    final jobPost = JobModel.fromJson(jobPostQuery.data()!);
    final newJobPost =
        jobPost.copyWith(applicantCounter: jobPost.applicantCounter + 1);
  }
}
