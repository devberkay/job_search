// This file is "main.dart"
import 'package:JobSearch/model/data/application_model.dart';
import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/data/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'merged_manage_job_post_model.freezed.dart';


@freezed
class MergedManageJobPostModel with _$MergedManageJobPostModel {
  const factory MergedManageJobPostModel({
    required ApplicationModel applicationModel,
    required JobModel jobModel,
    required UserModel applicantModel,
    
  }) = _MergedManageJobPostModel;

}