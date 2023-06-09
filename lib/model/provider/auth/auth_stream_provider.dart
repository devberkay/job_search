import 'package:JobSearch/model/provider/auth/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authStreamProvider = StreamProvider<User?>((ref) async* {
  final firebaseAuthSingleton = ref.watch(firebaseAuthProvider);
  await for(final user in firebaseAuthSingleton.authStateChanges()){
    debugPrint("authStreamProvider: $user");
    yield user;
  }
  
});