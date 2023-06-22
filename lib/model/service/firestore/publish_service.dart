import 'dart:async';

import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final publishServiceProvider = AsyncNotifierProvider.autoDispose<PublishServiceNotifier, String?>(PublishServiceNotifier.new);

class PublishServiceNotifier extends AutoDisposeAsyncNotifier<String?> {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> publishJob(JobModel newJobModel) async {
    try {
      state = const AsyncLoading();
      final firestore = ref.read(firestoreProvider);
      await firestore.collection('jobPosts').add(newJobModel.toJson());
      state = const AsyncData("OK");
    } catch (e,st) {
      state = AsyncError(e,st);
    }
  }
}
