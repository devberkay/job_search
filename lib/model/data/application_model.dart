// This file is "main.dart"
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'application_model.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'application_model.g.dart';

@freezed
class ApplicationModel with _$ApplicationModel {
  const factory ApplicationModel({
    required Map<String,String>? questionnaireAnswers,
    required String uid, // user id of who applioed to the job
    required String ownerUid, // user id of who posted the job
    required String jobId,
    required dynamic timestampField,
    required bool? status, // can be null= unanswered by the owner, true= accepted, false= rejected
    required bool isJobOffer
  }) = _ApplicationModel;

  factory ApplicationModel.fromJson(Map<String, Object?> json) =>
      _$ApplicationModelFromJson(json);
}
