import 'dart:async';

import 'package:JobSearch/model/provider/storage/storage_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final storagePictureProvider = AsyncNotifierProvider.autoDispose
    .family<StoragePictureNotifier, String?, String?>(
        StoragePictureNotifier.new);

class StoragePictureNotifier
    extends AutoDisposeFamilyAsyncNotifier<String?, String> {
  @override
  FutureOr<String?> build(String? arg) async {
    if (arg == null) {
      return null;
    }
    // arg is full path of the storage ref
    final downloadUrl = await generateDownloadUrl();
    // ref.keepAlive();
    return downloadUrl;
  }

  Future<String?> generateDownloadUrl() async {
    try {
      if (arg == null) {
      return null;
    }
      final fullRefPath = arg;
      final storage = ref.read(storageProvider);
      final storageRef = storage.ref(fullRefPath);
      final downloadUrl = await storageRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      return null;
    }
  }

  Future<void> buildDownloadUrl() async {
    try {
      if (arg == null) {
      return null;
    }
      // i am not putting into AsyncLoading state on purpose to keep old picture while loading instead of showing nothing
      final fullRefPath = arg;
      final storage = ref.read(storageProvider);
      final storageRef = storage.ref(fullRefPath);
      final downloadUrl = await storageRef.getDownloadURL();
      state = AsyncData(downloadUrl);
    } catch (e) {
      return null;
    }
  }
}
