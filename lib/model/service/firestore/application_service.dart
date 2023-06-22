import 'dart:async';

import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ApplicatioNServiceNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> applyJob() async {
    final firestore = ref.read(firestoreProvider);
    final applicationCollectionRef = firestore.collection('applications');
    final jobPostsCollectionRef = firestore.collection('jobPosts');
  }
}
