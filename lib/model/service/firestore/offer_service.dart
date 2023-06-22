import 'dart:async';

import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfferServiceNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> offerJob() async {
    final firestore = ref.read(firestoreProvider);
    final offerCollectionRef = firestore.collection('offers');
    
  }
}
