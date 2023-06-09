import 'package:JobSearch/model/provider/auth/auth_provider.dart';
import 'package:JobSearch/model/provider/auth/auth_stream_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider = Provider.autoDispose<User?>((ref) {
  final user = ref.watch(authStreamProvider).asData?.valueOrNull;
  debugPrint("userProvider: $user");
  return user;
});
