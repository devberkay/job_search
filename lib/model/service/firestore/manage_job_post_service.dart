import 'package:JobSearch/model/data/merged_job_post_manage_model.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ManageJobPostServiceStreamNotifier
    extends StreamNotifier<MergedJobPostManageModel> {
  @override
  Stream<MergedJobPostManageModel?> build() {
    final firestore = ref.read(firestoreProvider);
    final selfUserId = ref.read(userProvider)!.uid;
    final jobPostStream = firestore.collection('jobPosts').where('owner', isEqualTo: selfUserId).where('isActive',isEqualTo: null);
    
  }
}
