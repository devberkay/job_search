import 'dart:async';

import 'package:JobSearch/model/data/application_model.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final applicationStatusChangeServiceProvider = AsyncNotifierProvider.autoDispose<ApplicationStatusChangeServiceNotifier, String?>(ApplicationStatusChangeServiceNotifier.new);

class ApplicationStatusChangeServiceNotifier extends AutoDisposeAsyncNotifier<String?> {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> acceptApplication(ApplicationModel applicationModel) async {
    state = AsyncLoading();
    final firestore = ref.read(firestoreProvider);
    final applicationCollectionRef = firestore.collection("applications");
    await applicationCollectionRef
        .doc(applicationModel.applicationId)
        .set(applicationModel.copyWith(status: true).toJson());
    state = AsyncData("ACCEPTED");
  }

  Future<void> rejectApplication(ApplicationModel applicationModel) async {
    state = AsyncLoading();
    final firestore = ref.read(firestoreProvider);
    final applicationCollectionRef = firestore.collection("applications");
    await applicationCollectionRef
        .doc(applicationModel.applicationId)
        .set(applicationModel.copyWith(status: false).toJson());
    state = AsyncData("REJECTED");
  }
}
