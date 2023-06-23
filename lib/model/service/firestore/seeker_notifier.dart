import 'dart:async';

import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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





class SeekerNotifier extends AutoDisposeAsyncNotifier<List<UserModel>> {
  @override
  FutureOr<List<UserModel>> build() {
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
    var collectionRef = firestore.collection("jobPosts");
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
    return ;
  }
}