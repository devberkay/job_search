// This file is "main.dart"

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
    required List<String> titleTokens,
    required String degree, 
    required String jobType,
    required bool isRemote, // man or woman
    required String organization,
    required List<String> searchTokens,
    required String aboutJob,
    required double longitude,
    required double latitude,
    required double salaryPerHour,
    required int applicantCounter,
    required dynamic timestampField,
    String? jobId,
    required List<String> responsibilities,
    required List<String> minimumQualifications,
    required List<String> preferredQualifications,
    required List<String>? questionnaire
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, Object?> json) =>
      _$JobModelFromJson(json);
}
