import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/provider/auth/auth_stream_provider.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userModelProvider =
    FutureProvider.family.autoDispose<UserModel?, String?>((ref, arg) async {
  if (arg == null) {
    return null;
  }
  // final user = ref.watch(authStreamProvider).asData?.valueOrNull;
  final firestore = ref.watch(firestoreProvider);
  final query = await firestore.collection("users").doc(arg).get();
  final userModel = UserModel.fromJson(query.data()!);
  return userModel;
});
