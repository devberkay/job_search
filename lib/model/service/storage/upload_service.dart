import 'dart:async';
import 'dart:html';

import 'dart:typed_data';

import 'package:JobSearch/model/provider/storage/raw_picture_provider.dart';
import 'package:JobSearch/model/provider/storage/storage_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final uploadServiceProvider =
    AsyncNotifierProvider<UploadServiceNotifier, String?>(
        UploadServiceNotifier.new);

class UploadServiceNotifier extends AsyncNotifier<String?> {
  @override
  FutureOr<String?> build() async {
    return null;
  }

  Future<void> uploadPicture(
      {required Uint8List rawPicture, required String userId, SettableMetadata? settableMetadata}) async {
    try {
      state = const AsyncLoading();
      final storage = ref.read(storageProvider);
      await storage.ref("users/$userId/profile").putData(rawPicture);
      ref.invalidate(rawPictureProvider("users/$userId/profile"));
      state = const AsyncData("picture");
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> uploadFile(
      {required Uint8List cvFile, required String userId, SettableMetadata? settableMetadata}) async {
    try {
      state = const AsyncLoading();
      final storage = ref.read(storageProvider);
      await storage.ref("users/$userId/cv").putData(cvFile,settableMetadata);
      state = const AsyncData("file");
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
