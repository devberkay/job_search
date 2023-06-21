import 'dart:async';
import 'dart:html';

import 'dart:typed_data';

import 'package:JobSearch/model/provider/storage/storage_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final uploadServiceProvider = AsyncNotifierProvider<UploadServiceNotifier, >(UploadServiceNotifier.new);

class UploadServiceNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<void> uploadPicture(
      {required Uint8List rawPicture, required String userId}) async {
    try {
      state = const AsyncLoading();
      final storage = ref.read(storageProvider);
      await storage.ref("/users/$userId/profile").putData(rawPicture);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> uploadFile(
      {required File cvFile, required String userId}) async {
    try {
      state = const AsyncLoading();
      final storage = ref.read(storageProvider);
      await storage.ref("/users/$userId/cv").putBlob(cvFile);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
