// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobOfferModel _$JobOfferModelFromJson(Map<String, dynamic> json) {
  return _JobOfferModel.fromJson(json);
}

/// @nodoc
mixin _$JobOfferModel {
  String get senderUid =>
      throw _privateConstructorUsedError; // user id of who sent the offter
  String get recipientUid =>
      throw _privateConstructorUsedError; // user id of who received the offer
  String get jobId => throw _privateConstructorUsedError;
  dynamic get timestampField => throw _privateConstructorUsedError;
  String? get jobOfferId => throw _privateConstructorUsedError;
  bool? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobOfferModelCopyWith<JobOfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobOfferModelCopyWith<$Res> {
  factory $JobOfferModelCopyWith(
          JobOfferModel value, $Res Function(JobOfferModel) then) =
      _$JobOfferModelCopyWithImpl<$Res, JobOfferModel>;
  @useResult
  $Res call(
      {String senderUid,
      String recipientUid,
      String jobId,
      dynamic timestampField,
      String? jobOfferId,
      bool? status});
}

/// @nodoc
class _$JobOfferModelCopyWithImpl<$Res, $Val extends JobOfferModel>
    implements $JobOfferModelCopyWith<$Res> {
  _$JobOfferModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderUid = null,
    Object? recipientUid = null,
    Object? jobId = null,
    Object? timestampField = freezed,
    Object? jobOfferId = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      senderUid: null == senderUid
          ? _value.senderUid
          : senderUid // ignore: cast_nullable_to_non_nullable
              as String,
      recipientUid: null == recipientUid
          ? _value.recipientUid
          : recipientUid // ignore: cast_nullable_to_non_nullable
              as String,
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      timestampField: freezed == timestampField
          ? _value.timestampField
          : timestampField // ignore: cast_nullable_to_non_nullable
              as dynamic,
      jobOfferId: freezed == jobOfferId
          ? _value.jobOfferId
          : jobOfferId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JobOfferModelCopyWith<$Res>
    implements $JobOfferModelCopyWith<$Res> {
  factory _$$_JobOfferModelCopyWith(
          _$_JobOfferModel value, $Res Function(_$_JobOfferModel) then) =
      __$$_JobOfferModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String senderUid,
      String recipientUid,
      String jobId,
      dynamic timestampField,
      String? jobOfferId,
      bool? status});
}

/// @nodoc
class __$$_JobOfferModelCopyWithImpl<$Res>
    extends _$JobOfferModelCopyWithImpl<$Res, _$_JobOfferModel>
    implements _$$_JobOfferModelCopyWith<$Res> {
  __$$_JobOfferModelCopyWithImpl(
      _$_JobOfferModel _value, $Res Function(_$_JobOfferModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderUid = null,
    Object? recipientUid = null,
    Object? jobId = null,
    Object? timestampField = freezed,
    Object? jobOfferId = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_JobOfferModel(
      senderUid: null == senderUid
          ? _value.senderUid
          : senderUid // ignore: cast_nullable_to_non_nullable
              as String,
      recipientUid: null == recipientUid
          ? _value.recipientUid
          : recipientUid // ignore: cast_nullable_to_non_nullable
              as String,
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      timestampField: freezed == timestampField
          ? _value.timestampField
          : timestampField // ignore: cast_nullable_to_non_nullable
              as dynamic,
      jobOfferId: freezed == jobOfferId
          ? _value.jobOfferId
          : jobOfferId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JobOfferModel with DiagnosticableTreeMixin implements _JobOfferModel {
  const _$_JobOfferModel(
      {required this.senderUid,
      required this.recipientUid,
      required this.jobId,
      required this.timestampField,
      this.jobOfferId,
      required this.status});

  factory _$_JobOfferModel.fromJson(Map<String, dynamic> json) =>
      _$$_JobOfferModelFromJson(json);

  @override
  final String senderUid;
// user id of who sent the offter
  @override
  final String recipientUid;
// user id of who received the offer
  @override
  final String jobId;
  @override
  final dynamic timestampField;
  @override
  final String? jobOfferId;
  @override
  final bool? status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'JobOfferModel(senderUid: $senderUid, recipientUid: $recipientUid, jobId: $jobId, timestampField: $timestampField, jobOfferId: $jobOfferId, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'JobOfferModel'))
      ..add(DiagnosticsProperty('senderUid', senderUid))
      ..add(DiagnosticsProperty('recipientUid', recipientUid))
      ..add(DiagnosticsProperty('jobId', jobId))
      ..add(DiagnosticsProperty('timestampField', timestampField))
      ..add(DiagnosticsProperty('jobOfferId', jobOfferId))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobOfferModel &&
            (identical(other.senderUid, senderUid) ||
                other.senderUid == senderUid) &&
            (identical(other.recipientUid, recipientUid) ||
                other.recipientUid == recipientUid) &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            const DeepCollectionEquality()
                .equals(other.timestampField, timestampField) &&
            (identical(other.jobOfferId, jobOfferId) ||
                other.jobOfferId == jobOfferId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, senderUid, recipientUid, jobId,
      const DeepCollectionEquality().hash(timestampField), jobOfferId, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobOfferModelCopyWith<_$_JobOfferModel> get copyWith =>
      __$$_JobOfferModelCopyWithImpl<_$_JobOfferModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JobOfferModelToJson(
      this,
    );
  }
}

abstract class _JobOfferModel implements JobOfferModel {
  const factory _JobOfferModel(
      {required final String senderUid,
      required final String recipientUid,
      required final String jobId,
      required final dynamic timestampField,
      final String? jobOfferId,
      required final bool? status}) = _$_JobOfferModel;

  factory _JobOfferModel.fromJson(Map<String, dynamic> json) =
      _$_JobOfferModel.fromJson;

  @override
  String get senderUid;
  @override // user id of who sent the offter
  String get recipientUid;
  @override // user id of who received the offer
  String get jobId;
  @override
  dynamic get timestampField;
  @override
  String? get jobOfferId;
  @override
  bool? get status;
  @override
  @JsonKey(ignore: true)
  _$$_JobOfferModelCopyWith<_$_JobOfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}
