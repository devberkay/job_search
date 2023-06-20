import 'dart:async';

import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/provider/firestore/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final orderByProvider = StateProvider<String?>((ref) {
  return null;
});

final whatDoYouWantToDoListProvider = NotifierProvider<WhatDoYouWantToDoListNotifier,List<String>>(WhatDoYouWantToDoListNotifier.new);

class WhatDoYouWantToDoListNotifier extends Notifier<List<String>> {
  @override
   build() {
    return [];
  }
  void add(String value) {
    state = [...state];
  }
  void remove(String value) {
    state = [...state]..remove(value);
  }
}

final skillsListProvider = NotifierProvider<SkillsListNotifier, List<String>>(SkillsListNotifier.new);


class SkillsListNotifier extends Notifier<List<String>> {
  @override
   build() {
    return [];
  }
  void add(String value) {
    state = [...state, value];
  }
  void remove(String value) {
    state = [...state]..remove(value);
  }
}


final degreesSetProvider = NotifierProvider<DegreesSetNotifier,Set<String> >(DegreesSetNotifier.new);

class DegreesSetNotifier extends Notifier<Set<String>> {
  @override
   build() {
    return {};
  }
  void add(String value) {
    state = {...state, value};
  }
  void remove(String value) {
    state = {...state}..remove(value);
  }
}


final jobTypesSetProvider = NotifierProvider<JobTypesSetNotifier,Set<String> >(JobTypesSetNotifier.new);

class JobTypesSetNotifier extends Notifier<Set<String>> {
  @override
   build() {
    return {};
  }
  void add(String value) {
    state = {...state, value};
  }
  void remove(String value) {
    state = {...state}..remove(value);
  }
}


final isRemoteEligibleProvider = StateProvider<bool>((ref) {
  return false;
});

final lastJobDocProvider = StateProvider<DocumentSnapshot?>((ref) {
  return null;
});

final jobNotifierProvider =
    AsyncNotifierProvider.autoDispose<JobNotifier, List<JobModel>?>(
        JobNotifier.new);

class JobNotifier extends AutoDisposeAsyncNotifier<List<JobModel>?> {
  @override
  FutureOr<List<JobModel>?> build() async {
    final orderBy = ref.watch(orderByProvider);
    final whatDoYouWantToDoFilterList = ref
        .watch(whatDoYouWantToDoListProvider)
        .expand((element) => [
              element,
              element.toLowerCase(),
              element[0].toUpperCase() + element.substring(1)
            ])
        .toList();
    final skillsFilterList = ref
        .watch(skillsListProvider)
        .expand((element) => [
              element,
              element.toLowerCase(),
              element[0].toUpperCase() + element.substring(1)
            ])
        .toList();
    final degreesFilterSet = ref.watch(degreesSetProvider);
    final jobTypesFilterSet = ref.watch(jobTypesSetProvider);
    final isRemoteEligibleFilterBoolean = ref.watch(isRemoteEligibleProvider);
    // Filter filters;
    final writtenFilterList = [
      ...whatDoYouWantToDoFilterList,
      ...skillsFilterList
    ];
    //  filters = Filter.and(
    //       degreesFilterSet.toList().isNotEmpty
    //           ? Filter("degree", whereIn: degreesFilterSet.toList())
    //           : Filter("degree", whereIn: [
    //               "Associate"
    //                   "Bachelor’s"
    //                   "Master’s"
    //                   "Ph.D."
    //                   "Pursuing Degree"
    //             ]),
    //       Filter("isRemote", isEqualTo: isRemoteEligibleFilterBoolean),
    //       jobTypesFilterSet.isNotEmpty
    //           ? Filter("jobType", whereIn: jobTypesFilterSet.toList())
    //           : Filter("jobType", whereIn: [
    //               "White-collar roles",
    //               "Blue-collar roles",
    //               "IT roles",
    //               "Vehicle-driving roles",
    //               "Management roles",
    //               "Creative roles",
    //               "Sales roles"
    //             ]),
    //    writtenFilterList.isNotEmpty ?   Filter("searchTokens", arrayContainsAny: writtenFilterList) : Filter("searchTokens",isNull: false));

    final firestore = ref.watch(firestoreProvider);
    var collectionRef = firestore.collection("jobPosts");
    Query<Map<String,dynamic>>? query=null;
    
    final lastJobDoc = ref.read(lastJobDocProvider);
    if (degreesFilterSet.isNotEmpty) {
      if(query!=null) {
        query = query.where("degree", whereIn: degreesFilterSet);
      }
      else {
        query = collectionRef.where("degree", whereIn: degreesFilterSet);
      }
    }
    if (jobTypesFilterSet.isNotEmpty) {
     if(query!=null) {
        query = query.where("jobType", whereIn: jobTypesFilterSet);
      }
      else {
        query = collectionRef.where("jobType", whereIn: jobTypesFilterSet);
      }
    }
    if(isRemoteEligibleFilterBoolean) {
      if(query!=null) {
        query = query.where("isRemote", isEqualTo: isRemoteEligibleFilterBoolean);
      }
      else {
        query = collectionRef.where("isRemote", isEqualTo: isRemoteEligibleFilterBoolean);
      }
    }
    if(writtenFilterList.isNotEmpty) {
      if(query!=null) {
        query = query.where("searchTokens", arrayContainsAny: writtenFilterList);
      }
      else {
        query = collectionRef.where("searchTokens", arrayContainsAny: writtenFilterList);
      }
    }
    if(orderBy!=null) {
      if(query!=null) {
        query = query.orderBy(orderBy);
      }
      else {
         query = collectionRef.orderBy(orderBy);
      }
    }

    if (lastJobDoc != null) {
      debugPrint("jobNotifier-0");
      
      final snapshot =
          await (query!=null ? query.startAfterDocument(lastJobDoc).limit(15).get() : collectionRef.startAfterDocument(lastJobDoc).limit(15).get());
      debugPrint("jobNotifier-1");
      final jobModels = snapshot.docs.map((e) {
        return JobModel.fromJson(e.data()).copyWith(jobId: e.id);
      }).toList();
      ref.read(lastJobDocProvider.notifier).state = snapshot.docs.last;
      // debugPrint("jobModels : $jobModels");
      return jobModels;
    } else {
      debugPrint("jobNotifier-2");

      final snapshot =
          await (query!=null ? query.limit(15).get() : collectionRef.limit(15).get());
      debugPrint("jobNotifier-3");
      final jobModels = snapshot.docs.map((e) {
        return JobModel.fromJson(e.data()).copyWith(jobId: e.id);
      }).toList();
      debugPrint("jobNotifier-4");
      ref.read(lastJobDocProvider.notifier).state = snapshot.docs.last;
      debugPrint("jobModels : $jobModels");
      return jobModels;
    }
  }
}
