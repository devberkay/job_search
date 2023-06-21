// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      uid: json['uid'] as String,
      isSeekingJob: json['isSeekingJob'] as bool? ?? false,
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      positionTitles: (json['positionTitles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      sex: json['sex'] as String?,
      bio: json['bio'] as String?,
      mail: json['mail'] as String?,
      phone: json['phone'] as String?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'isSeekingJob': instance.isSeekingJob,
      'skills': instance.skills,
      'positionTitles': instance.positionTitles,
      'name': instance.name,
      'surname': instance.surname,
      'sex': instance.sex,
      'bio': instance.bio,
      'mail': instance.mail,
      'phone': instance.phone,
      'age': instance.age,
    };
