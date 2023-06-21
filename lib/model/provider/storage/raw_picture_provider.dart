import 'dart:async';
import 'dart:js_interop';
import 'dart:typed_data';

import 'package:JobSearch/model/provider/storage/storage_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final rawPictureProvider = AsyncNotifierProvider.autoDispose
    .family<StoragePictureNotifier, Uint8List?, String?>(
        StoragePictureNotifier.new);

class StoragePictureNotifier
    extends AutoDisposeFamilyAsyncNotifier<Uint8List?, String?> {
  @override
  FutureOr<Uint8List?> build(String? arg) async {
    if (arg == null) {
      return null;
    }
    // arg is full path of the storage ref
    final rawData = await downloadRawData();
    // ref.keepAlive();
    return rawData;
  }

  Future<Uint8List?> downloadRawData() async {
    try {
      if (arg == null) {
        debugPrint("holo-1: ");
        return null;
      }
      final fullRefPath = arg;
      final storage = ref.read(storageProvider);
      final storageRef = storage.ref(fullRefPath);
      // final downloadUrl = await storageRef.getDownloadURL();
      final rawPicture = await storageRef.getData();
      debugPrint("holo-2: ${rawPicture.isNull}");
      return rawPicture;
    } catch (e) {
      return null;
    }
  }
}
