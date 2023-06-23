import 'package:JobSearch/model/data/application_model.dart';
import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/data/merged_my_applications_model.dart';
import 'package:JobSearch/model/provider/auth/user_model_provider.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final myApplicationsStreamProvider = StreamNotifierProvider.autoDispose<
    MyApplicationsNotifier,
    List<MergedMyApplicationsModel>>(MyApplicationsNotifier.new);

class MyApplicationsNotifier
    extends AutoDisposeStreamNotifier<List<MergedMyApplicationsModel>> {
  @override
  Stream<List<MergedMyApplicationsModel>> build() async* {
    final firestore = ref.read(firestoreProvider);
    final mergedMyApplications = <MergedMyApplicationsModel>[];
    final selfUserUid = ref.read(userProvider)!.uid;
    final applicationsCollectionRef = firestore.collection('applications');
    final jobsCollectionRef = firestore.collection('jobPosts');
    final applicationsStream = applicationsCollectionRef
        .where('ownerUid', isEqualTo: selfUserUid)
        .snapshots();
    await for (final myApplicationsQuery in applicationsStream) {
      if (myApplicationsQuery.size == 0) {
        debugPrint("errorish-1");
        yield [];
        break;
      }
      final myApplications = myApplicationsQuery.docs
          .map((e) =>
              ApplicationModel.fromJson(e.data()).copyWith(applicationId: e.id))
          .toList();
      final jobModelsQueries = await Future.wait(myApplications
          .map((e) => jobsCollectionRef.doc(e.jobId).get())
          .toList());
      final jobModels = jobModelsQueries
          .map((e) => JobModel.fromJson(e.data()!).copyWith(jobId: e.id))
          .toList();

      for (var i = 0; i < myApplications.length; i++) {
        mergedMyApplications.add(MergedMyApplicationsModel(
          jobModel: jobModels[i],
          applicationModel: myApplications[i],
        ));
      }
      yield mergedMyApplications;
    }
  }
}
