// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_merged_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OfferMergedModel {
  JobModel get invitedJobModel => throw _privateConstructorUsedError;
  UserModel get applicantModel => throw _privateConstructorUsedError;
  JobOfferModel get jobOfferModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OfferMergedModelCopyWith<OfferMergedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferMergedModelCopyWith<$Res> {
  factory $OfferMergedModelCopyWith(
          OfferMergedModel value, $Res Function(OfferMergedModel) then) =
      _$OfferMergedModelCopyWithImpl<$Res, OfferMergedModel>;
  @useResult
  $Res call(
      {JobModel invitedJobModel,
      UserModel applicantModel,
      JobOfferModel jobOfferModel});

  $JobModelCopyWith<$Res> get invitedJobModel;
  $UserModelCopyWith<$Res> get applicantModel;
  $JobOfferModelCopyWith<$Res> get jobOfferModel;
}

/// @nodoc
class _$OfferMergedModelCopyWithImpl<$Res, $Val extends OfferMergedModel>
    implements $OfferMergedModelCopyWith<$Res> {
  _$OfferMergedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitedJobModel = null,
    Object? applicantModel = null,
    Object? jobOfferModel = null,
  }) {
    return _then(_value.copyWith(
      invitedJobModel: null == invitedJobModel
          ? _value.invitedJobModel
          : invitedJobModel // ignore: cast_nullable_to_non_nullable
              as JobModel,
      applicantModel: null == applicantModel
          ? _value.applicantModel
          : applicantModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
      jobOfferModel: null == jobOfferModel
          ? _value.jobOfferModel
          : jobOfferModel // ignore: cast_nullable_to_non_nullable
              as JobOfferModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $JobModelCopyWith<$Res> get invitedJobModel {
    return $JobModelCopyWith<$Res>(_value.invitedJobModel, (value) {
      return _then(_value.copyWith(invitedJobModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get applicantModel {
    return $UserModelCopyWith<$Res>(_value.applicantModel, (value) {
      return _then(_value.copyWith(applicantModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $JobOfferModelCopyWith<$Res> get jobOfferModel {
    return $JobOfferModelCopyWith<$Res>(_value.jobOfferModel, (value) {
      return _then(_value.copyWith(jobOfferModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OfferMergedModelCopyWith<$Res>
    implements $OfferMergedModelCopyWith<$Res> {
  factory _$$_OfferMergedModelCopyWith(
          _$_OfferMergedModel value, $Res Function(_$_OfferMergedModel) then) =
      __$$_OfferMergedModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {JobModel invitedJobModel,
      UserModel applicantModel,
      JobOfferModel jobOfferModel});

  @override
  $JobModelCopyWith<$Res> get invitedJobModel;
  @override
  $UserModelCopyWith<$Res> get applicantModel;
  @override
  $JobOfferModelCopyWith<$Res> get jobOfferModel;
}

/// @nodoc
class __$$_OfferMergedModelCopyWithImpl<$Res>
    extends _$OfferMergedModelCopyWithImpl<$Res, _$_OfferMergedModel>
    implements _$$_OfferMergedModelCopyWith<$Res> {
  __$$_OfferMergedModelCopyWithImpl(
      _$_OfferMergedModel _value, $Res Function(_$_OfferMergedModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitedJobModel = null,
    Object? applicantModel = null,
    Object? jobOfferModel = null,
  }) {
    return _then(_$_OfferMergedModel(
      invitedJobModel: null == invitedJobModel
          ? _value.invitedJobModel
          : invitedJobModel // ignore: cast_nullable_to_non_nullable
              as JobModel,
      applicantModel: null == applicantModel
          ? _value.applicantModel
          : applicantModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
      jobOfferModel: null == jobOfferModel
          ? _value.jobOfferModel
          : jobOfferModel // ignore: cast_nullable_to_non_nullable
              as JobOfferModel,
    ));
  }
}

/// @nodoc

class _$_OfferMergedModel
    with DiagnosticableTreeMixin
    implements _OfferMergedModel {
  const _$_OfferMergedModel(
      {required this.invitedJobModel,
      required this.applicantModel,
      required this.jobOfferModel});

  @override
  final JobModel invitedJobModel;
  @override
  final UserModel applicantModel;
  @override
  final JobOfferModel jobOfferModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfferMergedModel(invitedJobModel: $invitedJobModel, applicantModel: $applicantModel, jobOfferModel: $jobOfferModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OfferMergedModel'))
      ..add(DiagnosticsProperty('invitedJobModel', invitedJobModel))
      ..add(DiagnosticsProperty('applicantModel', applicantModel))
      ..add(DiagnosticsProperty('jobOfferModel', jobOfferModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OfferMergedModel &&
            (identical(other.invitedJobModel, invitedJobModel) ||
                other.invitedJobModel == invitedJobModel) &&
            (identical(other.applicantModel, applicantModel) ||
                other.applicantModel == applicantModel) &&
            (identical(other.jobOfferModel, jobOfferModel) ||
                other.jobOfferModel == jobOfferModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, invitedJobModel, applicantModel, jobOfferModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OfferMergedModelCopyWith<_$_OfferMergedModel> get copyWith =>
      __$$_OfferMergedModelCopyWithImpl<_$_OfferMergedModel>(this, _$identity);
}

abstract class _OfferMergedModel implements OfferMergedModel {
  const factory _OfferMergedModel(
      {required final JobModel invitedJobModel,
      required final UserModel applicantModel,
      required final JobOfferModel jobOfferModel}) = _$_OfferMergedModel;

  @override
  JobModel get invitedJobModel;
  @override
  UserModel get applicantModel;
  @override
  JobOfferModel get jobOfferModel;
  @override
  @JsonKey(ignore: true)
  _$$_OfferMergedModelCopyWith<_$_OfferMergedModel> get copyWith =>
      throw _privateConstructorUsedError;
}
