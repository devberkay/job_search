import 'dart:async';

import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final responsibilitiesNotifierProvider = AsyncNotifierProvider.autoDispose.family<ResponsibilitiesNotifier,List<String>?,String >(ResponsibilitiesNotifier.new);


class ResponsibilitiesNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<String>?, String> {
  @override
  FutureOr<List<String>?> build(String arg) async {
    // arg here is the job document id
    final firestore = ref.read(firestoreProvider);
    final collectionRef =
        firestore.collection("jobPosts/$arg/responsibilities");
    final query = await collectionRef.get();
    return query.docs
        .map((e) => (e.data()["qualifications"] as List<String>).join(" "))
        .toList();
  }
}
