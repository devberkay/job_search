import 'dart:async';

import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final seekerSkillsListProvider =
    NotifierProvider.autoDispose<SeekerSkillsListNotifier, List<String>>(
        SeekerSkillsListNotifier.new);

class SeekerSkillsListNotifier extends AutoDisposeNotifier<List<String>> {
  @override
  build() {
    return [];
  }

  void add(List<String> value) {
    state = [...state, ...value];
  }

  void remove(String value) {
    state = [...state]..remove(value);
  }
}



final seekerPositionTitleListProvider =
    NotifierProvider.autoDispose<SeekerPositionTitleListProvider, List<String>>(
        SeekerPositionTitleListProvider.new);

class SeekerPositionTitleListProvider extends AutoDisposeNotifier<List<String>> {
  @override
  build() {
    return [];
  }

  void add(List<String> value) {
    state = [...state, ...value];
  }

  void remove(String value) {
    state = [...state]..remove(value);
  }
}



final lastUserModelDocProvider = StateProvider<DocumentSnapshot?>((ref) {
  return null;
});

final seekerNotifierProvider = AsyncNotifierProvider.autoDispose.family<SeekerNotifier, List<UserModel>,bool>(SeekerNotifier.new);


class SeekerNotifier extends AutoDisposeFamilyAsyncNotifier<List<UserModel>,bool> {
  @override
  FutureOr<List<UserModel>> build(bool arg) async {
    final lastJobDoc = ref.read(lastUserModelDocProvider); // bura watch olmali petpeeve
    final seekerPositionTitleFilterList = ref
        .watch(seekerPositionTitleListProvider)
        .expand((element) => [
              element,
              element.toLowerCase(),
              element[0].toUpperCase() + element.substring(1)
            ])
        .toList();
    final seekerSkillsFilterList = ref
        .watch(seekerSkillsListProvider)
        .expand((element) => [
              element,
              element.toLowerCase(),
              element[0].toUpperCase() + element.substring(1)
            ])
        .toList();
    final firestore = ref.watch(firestoreProvider);
    var collectionRef = firestore.collection("users");
    Query<Map<String, dynamic>>? query = null;
    if (seekerPositionTitleFilterList.isNotEmpty) {
      if (query != null) {
        query = query.where("positionTitles",
            arrayContainsAny: seekerPositionTitleFilterList);
      } else {
        query = collectionRef.where("positionTitles",
            arrayContainsAny: seekerPositionTitleFilterList);
      }
    }
    if (seekerSkillsFilterList.isNotEmpty) {
      if (query != null) {
        query = query.where("skills", arrayContainsAny: seekerSkillsFilterList);
      } else {
        query = collectionRef.where("skills",
            arrayContainsAny: seekerSkillsFilterList);
      }
    }
    if (lastJobDoc != null && arg) {
      debugPrint("SeekerNotifier-0");
      final snapshot = await (query != null
          ? query.startAfterDocument(lastJobDoc).limit(15).get()
          : collectionRef.startAfterDocument(lastJobDoc).limit(15).get());
      debugPrint("SeekerNotifier-1");
      final jobModels = snapshot.docs.map((e) {
        return UserModel.fromJson(e.data());
      }).toList();
      ref.read(lastUserModelDocProvider.notifier).state =
          snapshot.docs.isNotEmpty ? snapshot.docs.last : null;
      // debugPrint("jobModels : $jobModels");
      return jobModels;
    } else {
      debugPrint("SeekerNotifier-2");

      final snapshot = await (query != null
          ? query.limit(15).get()
          : collectionRef.limit(15).get());
      debugPrint("SeekerNotifier-3");
      final jobModels = snapshot.docs.map((e) {
        return UserModel.fromJson(e.data());
      }).toList();
      debugPrint("SeekerNotifier-4");
      ref.read(lastUserModelDocProvider.notifier).state =
          snapshot.docs.isNotEmpty ? snapshot.docs.last : null;
      debugPrint("seekerModels : $jobModels");
      return jobModels;
    }
    
  }
}