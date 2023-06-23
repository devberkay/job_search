import 'dart:async';

import 'package:JobSearch/model/data/application_model.dart';
import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final applicationServiceProvider = AsyncNotifierProvider<ApplicatioNServiceNotifier, String?>(ApplicatioNServiceNotifier.new);

class ApplicatioNServiceNotifier extends AsyncNotifier<String?> {
  @override
  FutureOr<String?> build() async {
    return null;
  }

  Future<void> applyJob({required JobModel jobModel,required Map<String,String>? questionnaireAnswers}) async {
    state = AsyncLoading();
    
    final firestore = ref.read(firestoreProvider);
    final selfUserId = ref.read(userProvider)!.uid;
    if(selfUserId == jobModel.owner){
      state = AsyncData("CANNOT_APPLY_TO_OWN_JOB");
      return;
    }
    final applicationCollectionRef = firestore.collection('applications');
    final jobPostsCollectionDocRef =
        firestore.collection('jobPosts').doc(jobModel.jobId);
    final didApplyBeforeQuery = await applicationCollectionRef
        .where('uid', isEqualTo: selfUserId)
        .where('jobId', isEqualTo: jobModel.jobId)
        .count()
        .get();
    final didApplyBefore = didApplyBeforeQuery.count > 0;
    if (didApplyBefore) {
      state = AsyncData("ALREADY_APPLIED");
      return;
    }
    final jobPostQuery = await jobPostsCollectionDocRef.get();
    final jobPost = JobModel.fromJson(jobPostQuery.data()!);
    final newJobPost =
        jobPost.copyWith(applicantCounter: jobPost.applicantCounter + 1);
    await Future.wait([jobPostsCollectionDocRef.set(newJobPost.toJson()),applicationCollectionRef.add(ApplicationModel(questionnaireAnswers: questionnaireAnswers, uid: selfUserId, ownerUid: jobModel.owner, jobId: jobModel.jobId!, timestampField: FieldValue.serverTimestamp(), status: null).toJson())]);
    state = AsyncData("SUCCESS");
  }
}
