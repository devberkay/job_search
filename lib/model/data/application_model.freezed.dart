// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApplicationModel _$ApplicationModelFromJson(Map<String, dynamic> json) {
  return _ApplicationModel.fromJson(json);
}

/// @nodoc
mixin _$ApplicationModel {
  Map<String, String>? get questionnaireAnswers =>
      throw _privateConstructorUsedError;
  String get uid =>
      throw _privateConstructorUsedError; // user id of who applied to the job, a.k.a sender
  String get ownerUid =>
      throw _privateConstructorUsedError; // user id of who posted the job, a.k.a recipient
  String get jobId => throw _privateConstructorUsedError;
  dynamic get timestampField => throw _privateConstructorUsedError;
  String? get applicationId => throw _privateConstructorUsedError;
  bool? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationModelCopyWith<ApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationModelCopyWith<$Res> {
  factory $ApplicationModelCopyWith(
          ApplicationModel value, $Res Function(ApplicationModel) then) =
      _$ApplicationModelCopyWithImpl<$Res, ApplicationModel>;
  @useResult
  $Res call(
      {Map<String, String>? questionnaireAnswers,
      String uid,
      String ownerUid,
      String jobId,
      dynamic timestampField,
      String? applicationId,
      bool? status});
}

/// @nodoc
class _$ApplicationModelCopyWithImpl<$Res, $Val extends ApplicationModel>
    implements $ApplicationModelCopyWith<$Res> {
  _$ApplicationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionnaireAnswers = freezed,
    Object? uid = null,
    Object? ownerUid = null,
    Object? jobId = null,
    Object? timestampField = freezed,
    Object? applicationId = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      questionnaireAnswers: freezed == questionnaireAnswers
          ? _value.questionnaireAnswers
          : questionnaireAnswers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUid: null == ownerUid
          ? _value.ownerUid
          : ownerUid // ignore: cast_nullable_to_non_nullable
              as String,
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      timestampField: freezed == timestampField
          ? _value.timestampField
          : timestampField // ignore: cast_nullable_to_non_nullable
              as dynamic,
      applicationId: freezed == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApplicationModelCopyWith<$Res>
    implements $ApplicationModelCopyWith<$Res> {
  factory _$$_ApplicationModelCopyWith(
          _$_ApplicationModel value, $Res Function(_$_ApplicationModel) then) =
      __$$_ApplicationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, String>? questionnaireAnswers,
      String uid,
      String ownerUid,
      String jobId,
      dynamic timestampField,
      String? applicationId,
      bool? status});
}

/// @nodoc
class __$$_ApplicationModelCopyWithImpl<$Res>
    extends _$ApplicationModelCopyWithImpl<$Res, _$_ApplicationModel>
    implements _$$_ApplicationModelCopyWith<$Res> {
  __$$_ApplicationModelCopyWithImpl(
      _$_ApplicationModel _value, $Res Function(_$_ApplicationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionnaireAnswers = freezed,
    Object? uid = null,
    Object? ownerUid = null,
    Object? jobId = null,
    Object? timestampField = freezed,
    Object? applicationId = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ApplicationModel(
      questionnaireAnswers: freezed == questionnaireAnswers
          ? _value._questionnaireAnswers
          : questionnaireAnswers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUid: null == ownerUid
          ? _value.ownerUid
          : ownerUid // ignore: cast_nullable_to_non_nullable
              as String,
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      timestampField: freezed == timestampField
          ? _value.timestampField
          : timestampField // ignore: cast_nullable_to_non_nullable
              as dynamic,
      applicationId: freezed == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
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
class _$_ApplicationModel
    with DiagnosticableTreeMixin
    implements _ApplicationModel {
  const _$_ApplicationModel(
      {required final Map<String, String>? questionnaireAnswers,
      required this.uid,
      required this.ownerUid,
      required this.jobId,
      required this.timestampField,
      this.applicationId,
      required this.status})
      : _questionnaireAnswers = questionnaireAnswers;

  factory _$_ApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$$_ApplicationModelFromJson(json);

  final Map<String, String>? _questionnaireAnswers;
  @override
  Map<String, String>? get questionnaireAnswers {
    final value = _questionnaireAnswers;
    if (value == null) return null;
    if (_questionnaireAnswers is EqualUnmodifiableMapView)
      return _questionnaireAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String uid;
// user id of who applied to the job, a.k.a sender
  @override
  final String ownerUid;
// user id of who posted the job, a.k.a recipient
  @override
  final String jobId;
  @override
  final dynamic timestampField;
  @override
  final String? applicationId;
  @override
  final bool? status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApplicationModel(questionnaireAnswers: $questionnaireAnswers, uid: $uid, ownerUid: $ownerUid, jobId: $jobId, timestampField: $timestampField, applicationId: $applicationId, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApplicationModel'))
      ..add(DiagnosticsProperty('questionnaireAnswers', questionnaireAnswers))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('ownerUid', ownerUid))
      ..add(DiagnosticsProperty('jobId', jobId))
      ..add(DiagnosticsProperty('timestampField', timestampField))
      ..add(DiagnosticsProperty('applicationId', applicationId))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApplicationModel &&
            const DeepCollectionEquality()
                .equals(other._questionnaireAnswers, _questionnaireAnswers) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.ownerUid, ownerUid) ||
                other.ownerUid == ownerUid) &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            const DeepCollectionEquality()
                .equals(other.timestampField, timestampField) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_questionnaireAnswers),
      uid,
      ownerUid,
      jobId,
      const DeepCollectionEquality().hash(timestampField),
      applicationId,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApplicationModelCopyWith<_$_ApplicationModel> get copyWith =>
      __$$_ApplicationModelCopyWithImpl<_$_ApplicationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApplicationModelToJson(
      this,
    );
  }
}

abstract class _ApplicationModel implements ApplicationModel {
  const factory _ApplicationModel(
      {required final Map<String, String>? questionnaireAnswers,
      required final String uid,
      required final String ownerUid,
      required final String jobId,
      required final dynamic timestampField,
      final String? applicationId,
      required final bool? status}) = _$_ApplicationModel;

  factory _ApplicationModel.fromJson(Map<String, dynamic> json) =
      _$_ApplicationModel.fromJson;

  @override
  Map<String, String>? get questionnaireAnswers;
  @override
  String get uid;
  @override // user id of who applied to the job, a.k.a sender
  String get ownerUid;
  @override // user id of who posted the job, a.k.a recipient
  String get jobId;
  @override
  dynamic get timestampField;
  @override
  String? get applicationId;
  @override
  bool? get status;
  @override
  @JsonKey(ignore: true)
  _$$_ApplicationModelCopyWith<_$_ApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
