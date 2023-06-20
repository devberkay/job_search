import 'dart:async';

import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userModelServiceProvider = AsyncNotifierProvider.autoDispose<UserModelServiceNotifier,void >(UserModelServiceNotifier.new);

class UserModelServiceNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> updateUserModel(UserModel draftUserModel) async {
    state = AsyncLoading();
    final firestore = ref.read(firestoreProvider);
    final collectionRef = firestore.collection("users");
    final docRef = collectionRef.doc(draftUserModel.uid);
    await docRef.update(draftUserModel.toJson());
    state = AsyncData(null);
  }
}
