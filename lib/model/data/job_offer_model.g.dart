// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobOfferModel _$$_JobOfferModelFromJson(Map<String, dynamic> json) =>
    _$_JobOfferModel(
      senderUid: json['senderUid'] as String,
      recipientUid: json['recipientUid'] as String,
      jobId: json['jobId'] as String,
      timestampField: json['timestampField'],
      jobOfferId: json['jobOfferId'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$$_JobOfferModelToJson(_$_JobOfferModel instance) =>
    <String, dynamic>{
      'senderUid': instance.senderUid,
      'recipientUid': instance.recipientUid,
      'jobId': instance.jobId,
      'timestampField': instance.timestampField,
      'jobOfferId': instance.jobOfferId,
      'status': instance.status,
    };
