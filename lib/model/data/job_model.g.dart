// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobModel _$$_JobModelFromJson(Map<String, dynamic> json) => _$_JobModel(
      title: json['title'] as String,
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
      jobId: json['jobId'] as String?,
    );

Map<String, dynamic> _$$_JobModelToJson(_$_JobModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'degree': instance.degree,
      'jobType': instance.jobType,
      'isRemote': instance.isRemote,
      'organization': instance.organization,
      'searchTokens': instance.searchTokens,
      'aboutJob': instance.aboutJob,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'salaryPerHour': instance.salaryPerHour,
      'jobId': instance.jobId,
    };
