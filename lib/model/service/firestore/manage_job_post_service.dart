import 'package:JobSearch/model/data/merged_manage_job_post_model.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ManageJobPostServiceStreamNotifier
    extends StreamNotifier<MergedManageJobPostModel?> {
  @override
  Stream<MergedManageJobPostModel?> build() async* {
    final firestore = ref.read(firestoreProvider);
    final selfUserId = ref.read(userProvider)!.uid;
    final jobPostStream = firestore
        .collection('jobPosts')
        .where('owner', isEqualTo: selfUserId)
        .where('isActive', isEqualTo: true)
        .snapshots();
    
    await for (final jobs in jobPostStream) {
      await firestore.collection("applications").where("jobId",);
    }
  }
}
