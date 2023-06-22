// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplicationModel _$$_ApplicationModelFromJson(Map<String, dynamic> json) =>
    _$_ApplicationModel(
      questionnaireAnswers:
          (json['questionnaireAnswers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      uid: json['uid'] as String,
      ownerUid: json['ownerUid'] as String,
      jobId: json['jobId'] as String,
      timestampField: json['timestampField'],
      status: json['status'] as bool?,
      isJobOffer: json['isJobOffer'] as bool,
    );

Map<String, dynamic> _$$_ApplicationModelToJson(_$_ApplicationModel instance) =>
    <String, dynamic>{
      'questionnaireAnswers': instance.questionnaireAnswers,
      'uid': instance.uid,
      'ownerUid': instance.ownerUid,
      'jobId': instance.jobId,
      'timestampField': instance.timestampField,
      'status': instance.status,
      'isJobOffer': instance.isJobOffer,
    };
