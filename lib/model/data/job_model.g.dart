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
      minimumQualifications: json['minimumQualifications'] as String,
      preferredQualifications: json['preferredQualifications'] as String,
      responsibilities: json['responsibilities'] as String,
      aboutJob: json['aboutJob'] as String,
      longitude: json['longitude'] as int,
      latitude: json['latitude'] as int,
      salaryPerHour: json['salaryPerHour'] as int,
    );

Map<String, dynamic> _$$_JobModelToJson(_$_JobModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'degree': instance.degree,
      'jobType': instance.jobType,
      'isRemote': instance.isRemote,
      'organization': instance.organization,
      'minimumQualifications': instance.minimumQualifications,
      'preferredQualifications': instance.preferredQualifications,
      'responsibilities': instance.responsibilities,
      'aboutJob': instance.aboutJob,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'salaryPerHour': instance.salaryPerHour,
    };
