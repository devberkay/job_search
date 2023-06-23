import 'package:JobSearch/model/data/application_model.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final myApplicationsStreamProvider = StreamNotifierProvider.autoDispose<MyApplicationsNotifier,List<ApplicationModel> >(MyApplicationsNotifier.new);

class MyApplicationsNotifier extends AutoDisposeStreamNotifier<List<ApplicationModel>> {
  @override
  Stream<List<ApplicationModel>> build() async* {
    final firestore = ref.read(firestoreProvider);
    final selfUserUid = ref.read(userProvider)!.uid;
    final applicationsCollectionRef = firestore.collection('applications');
    final applicationsStream = applicationsCollectionRef.where('ownerUid',isEqualTo: selfUserUid).snapshots();
    await for (final myApplicationsQuery in applicationsStream) {

      final myApplications = myApplicationsQuery.docs.map((e) => ApplicationModel.fromJson(e.data()).copyWith(applicationId: e.id)).toList();
      yield myApplications;

    }
  }
}
