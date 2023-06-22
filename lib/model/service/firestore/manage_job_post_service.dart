import 'package:JobSearch/model/data/application_model.dart';
import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/data/merged_manage_job_post_model.dart';
import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final manageJobPostMergedModelProvider = StreamNotifierProvider.autoDispose<ManageJobPostServiceStreamNotifier,MergedManageJobPostModel >(ManageJobPostServiceStreamNotifier.new);

class ManageJobPostServiceStreamNotifier
    extends AutoDisposeStreamNotifier<MergedManageJobPostModel> {
  @override
  Stream<MergedManageJobPostModel> build() async* {
    var applicationModels = <ApplicationModel>[];
    var jobModels = <JobModel>[];
    var applicantUserModels = <UserModel>[];
    
    final firestore = ref.read(firestoreProvider);
    final selfUserId = ref.read(userProvider)!.uid;
    final applicationsStream = firestore
        .collection('applications')
        .where('ownerUid', isEqualTo: selfUserId)
        .where('status', isEqualTo: null)
        .snapshots(); // we get the ApplicationModels here

    await for (final assessableApplication in applicationsStream) {
      applicationModels = assessableApplication.docs
          .map((e) => ApplicationModel.fromJson(e.data()))
          .toList();
      // secondly get the usermodel of applicant
      final applicantUserModelQuery = await firestore
          .collection('users')
          .where('uid', whereIn: applicationModels.map((e) => e.uid).toList())
          .get();
      applicantUserModels = applicantUserModelQuery.docs
          .map((e) => UserModel.fromJson(e.data()))
          .toList();
      // third get the related jobmodel
      final jobModelQuery = await firestore
          .collection('jobPosts')
          .where(FieldPath.documentId,
              whereIn: applicationModels.map((e) => e.jobId).toList())
          .get();
      jobModels =
          jobModelQuery.docs.map((e) => JobModel.fromJson(e.data())).toList();
      yield MergedManageJobPostModel(
            applicationModels: applicationModels,
            applicantModels: applicantUserModels,
            jobModels: jobModels);
      // now create the list of  merged model
      // for (final applicationModel in applicationModels) {
      //   UserModel applicantUserModel;
      //   JobModel jobModel;
      //   try {
      //      applicantUserModel = applicantUserModels.firstWhere(
      //     (element) => element.uid == applicationModel.uid,
      //   );
      //    jobModel = jobModels.firstWhere(
      //       (element) => element.jobId == applicationModel.jobId);
      //   } catch (e) {
      //     continue;
      //   }
      //   mergedModels.add(MergedManageJobPostModel(
      //       applicationModel: applicationModel,
      //       applicantModel: applicantUserModel,
      //       jobModel: jobModel));
      }
      
    }
  }

