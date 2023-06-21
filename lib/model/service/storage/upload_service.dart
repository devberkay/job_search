import 'dart:async';
import 'dart:html';

import 'dart:typed_data';

import 'package:JobSearch/model/provider/storage/storage_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final uploadServiceProvider = AsyncNotifierProvider<UploadServiceNotifier,String? >(UploadServiceNotifier.new);

class UploadServiceNotifier extends AsyncNotifier<String?> {
  @override
  FutureOr<String?> build() async {
    return null;
  }

  Future<void> uploadPicture(
      {required Uint8List rawPicture, required String userId}) async {
    try {
      state = const AsyncLoading();
      final storage = ref.read(storageProvider);
      await storage.ref("/users/$userId/profile").putData(rawPicture);
      state = const AsyncData("picture");
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
      state = const AsyncData("file");
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
