// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplicationModel _$$_ApplicationModelFromJson(Map<String, dynamic> json) =>
    _$_ApplicationModel(
      questionnaireAnswers:
          Map<String, String>.from(json['questionnaireAnswers'] as Map),
      uid: json['uid'] as String,
      ownerUid: json['ownerUid'] as String,
      jobId: json['jobId'] as String,
      timestampField: json['timestampField'],
    );

Map<String, dynamic> _$$_ApplicationModelToJson(_$_ApplicationModel instance) =>
    <String, dynamic>{
      'questionnaireAnswers': instance.questionnaireAnswers,
      'uid': instance.uid,
      'ownerUid': instance.ownerUid,
      'jobId': instance.jobId,
      'timestampField': instance.timestampField,
    };
