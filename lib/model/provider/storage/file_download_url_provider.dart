import 'dart:async';
import 'dart:js_interop';
import 'dart:typed_data';


import 'package:JobSearch/model/provider/storage/storage_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fileDownloadUrlProvider = AsyncNotifierProvider.autoDispose
    .family<StorageFileNotifier, String?, String?>(StorageFileNotifier.new);

class StorageFileNotifier
    extends AutoDisposeFamilyAsyncNotifier<String?, String?> { // returns downloadUrl
  @override
  FutureOr<String?> build(String? arg) async {
    if (arg == null) {
      return null;
    }
    // arg is full path of the storage ref
    // final rawData = await downloadRawData();
    final downloadUrl = await getDownloadUrl();
    // final metadata = await getMetadata();

    // ref.keepAlive();
    return downloadUrl;
  }

  // Future<Uint8List?> downloadRawData() async {
  //   try {
  //     if (arg == null) {
  //       return null;
  //     }
  //     final fullRefPath = arg;

  //     final storage = ref.read(storageProvider);
  //     final storageRef = storage.ref(fullRefPath);
  //     // final downloadUrl = await storageRef.getDownloadURL();
  //     final rawFile = await storageRef.getData();

  //     return rawFile;
  //   } catch (e) {
  //     debugPrint("browzie_error: ${e.toString()}");
  //     return null;
  //   }
  // }

  Future<String?> getDownloadUrl() async {
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
      debugPrint("browzie_error: ${e.toString()}");
      return null;
    }
  }

  // Future<Map<String, String>?> getMetadata() async {
  //   try {
  //     if (arg == null) {
  //       return null;
  //     }
  //     final fullRefPath = arg;

  //     final storage = ref.read(storageProvider);
  //     final storageRef = storage.ref(fullRefPath);
  //     final fullMetadata = await storageRef.getMetadata();
  //     return fullMetadata.customMetadata;
  //   } catch (e) {
  //     debugPrint("browzie_error: ${e.toString()}");
  //     return null;
  //   }
  // }
}
