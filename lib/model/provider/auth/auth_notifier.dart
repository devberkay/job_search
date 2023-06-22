import 'dart:async';

import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/provider/auth/auth_provider.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:JobSearch/model/provider/storage/storage_provider.dart';
import 'package:JobSearch/model/service/auth/auth_service.dart';
import 'package:JobSearch/view/shared/auth_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authNotifierProvider =
    AsyncNotifierProvider.autoDispose<AuthNotifier, void>(AuthNotifier.new);

class AuthNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> signOut() async {
    final firebaseAuth = ref.read(firebaseAuthProvider);
    await firebaseAuth.signOut();
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();
    final authService = ref.read(authServiceProvider);
    try {
      await authService.signInWithGoogle();
      state = const AsyncData(null);
    } catch (e, st) {
      debugPrint("signInWithGoogle Error: $e");
      state = AsyncError(e, st);
    }
  }

  Future<void> signInWithMailAndPassword({
    required String? email,
    required String? password,
  }) async {
    state = const AsyncLoading();
    final authService = ref.read(authServiceProvider);

    try {
      await authService.signInWithEmailAndPassword(
          email: email!, password: password!);

      state = const AsyncData(null);
    } catch (e, st) {
      debugPrint("signInWithMailAndPassword Error: $e");
      state = AsyncError(e, st);
    }
  }

  Future<void> signUpWithMailAndPassword(
      {required String? email,
      required String? password,
      required String? name,
      required String? surname}) async {
    state = const AsyncLoading();

    final authService = ref.read(authServiceProvider);
    final firestore = ref.read(firestoreProvider);
    final firebaseAuth = ref.read(firebaseAuthProvider);
    try {
      await authService.signUpWithEmailAndPassword(
          email: email!, password: password!);
      final uid = await firebaseAuth.currentUser!.uid;
      firestore.collection("users").doc(uid).set(UserModel(
              uid: uid,
              name: name,
              surname: surname,
              mail: email,
              isSeekingJob: false)
          .toJson());
      state = const AsyncData(null);
    } catch (e, st) {
      debugPrint("signUpWithMailAndPassword Error: $e");
      state = AsyncError(e, st);
    }
  }
}
