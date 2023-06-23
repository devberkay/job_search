import 'package:JobSearch/model/data/application_model.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApplicationsNotifier extends StreamNotifier<List<ApplicationModel>> {
  @override
  Stream<List<ApplicationModel>> build() async* {
    final firestore = ref.read(firestoreProvider);
    final selfUser = ref.read(userProvider);
    final applicationsCollectionRef = firestore.collection('applications');
    final applicationsStream = applicationsCollectionRef.where(selfUser)
    await for ()
  }
}
