import 'dart:async';

import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final preferredQualificationsNotifierProvider = AsyncNotifierProvider.autoDispose.family<PreferredQualificationsNotifier,List<String>?,String >(PreferredQualificationsNotifier.new);


class PreferredQualificationsNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<String>?, String> {
  @override
  FutureOr<List<String>?> build(String arg) async {
    // arg here is the job document id
    final firestore = ref.read(firestoreProvider);
    final collectionRef =
        firestore.collection("jobPosts/$arg/preferredQualifications");
    final query = await collectionRef.get();
    return query.docs
        .map((e) => (e.data()["qualifications"] as List<String>).join(" "))
        .toList();
  }
}
