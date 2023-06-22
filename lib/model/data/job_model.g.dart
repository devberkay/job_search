// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobModel _$$_JobModelFromJson(Map<String, dynamic> json) => _$_JobModel(
      title: json['title'] as String,
      titleTokens: (json['titleTokens'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      degree: json['degree'] as String,
      jobType: json['jobType'] as String,
      isRemote: json['isRemote'] as bool,
      organization: json['organization'] as String,
      searchTokens: (json['searchTokens'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      aboutJob: json['aboutJob'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      salaryPerHour: (json['salaryPerHour'] as num).toDouble(),
      applicantCounter: json['applicantCounter'] as int,
      timestampField: json['timestampField'],
      isActive: json['isActive'] as bool,
      owner: json['owner'] as String? ?? null,
      jobId: json['jobId'] as String?,
      responsibilities: (json['responsibilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      minimumQualifications: (json['minimumQualifications'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      preferredQualifications:
          (json['preferredQualifications'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      questionnaire: (json['questionnaire'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_JobModelToJson(_$_JobModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'titleTokens': instance.titleTokens,
      'degree': instance.degree,
      'jobType': instance.jobType,
      'isRemote': instance.isRemote,
      'organization': instance.organization,
      'searchTokens': instance.searchTokens,
      'aboutJob': instance.aboutJob,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'salaryPerHour': instance.salaryPerHour,
      'applicantCounter': instance.applicantCounter,
      'timestampField': instance.timestampField,
      'isActive': instance.isActive,
      'owner': instance.owner,
      'jobId': instance.jobId,
      'responsibilities': instance.responsibilities,
      'minimumQualifications': instance.minimumQualifications,
      'preferredQualifications': instance.preferredQualifications,
      'questionnaire': instance.questionnaire,
    };
