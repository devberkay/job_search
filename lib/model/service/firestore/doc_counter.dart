import 'dart:async';

import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final docCounterProvider = AsyncNotifierProvider.autoDispose
    .family<DocCounterNotifier, int, String>(DocCounterNotifier.new);

class DocCounterNotifier extends AutoDisposeFamilyAsyncNotifier<int, String> {
  @override
  FutureOr<int> build(String arg) async {
    // arg here is the collectionPath
    final firestore = ref.read(firestoreProvider);
    final countQuery = await firestore.collection(arg).count().get();
    return countQuery.count;
  }
}
