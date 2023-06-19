// This file is "main.dart"
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'job_model.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'job_model.g.dart';

@freezed
class JobModel with _$JobModel {
  const factory JobModel({
    required String title,
    String? name, 
    String? surname,
    String? sex, // man or woman
    String? bio,
    String? mail,
    String? phone,
    dynamic
        birthDay, // shown in profile with "joined at $createdAt" title
    
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, Object?> json) =>
      _$JobModelFromJson(json);
}
