// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merged_job_post_manage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MergedJobPostManageModel {
  ApplicationModel get applicationModel => throw _privateConstructorUsedError;
  JobModel get jobModel => throw _privateConstructorUsedError;
  UserModel get applicantModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MergedJobPostManageModelCopyWith<MergedJobPostManageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MergedJobPostManageModelCopyWith<$Res> {
  factory $MergedJobPostManageModelCopyWith(MergedJobPostManageModel value,
          $Res Function(MergedJobPostManageModel) then) =
      _$MergedJobPostManageModelCopyWithImpl<$Res, MergedJobPostManageModel>;
  @useResult
  $Res call(
      {ApplicationModel applicationModel,
      JobModel jobModel,
      UserModel applicantModel});

  $ApplicationModelCopyWith<$Res> get applicationModel;
  $JobModelCopyWith<$Res> get jobModel;
  $UserModelCopyWith<$Res> get applicantModel;
}

/// @nodoc
class _$MergedJobPostManageModelCopyWithImpl<$Res,
        $Val extends MergedJobPostManageModel>
    implements $MergedJobPostManageModelCopyWith<$Res> {
  _$MergedJobPostManageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationModel = null,
    Object? jobModel = null,
    Object? applicantModel = null,
  }) {
    return _then(_value.copyWith(
      applicationModel: null == applicationModel
          ? _value.applicationModel
          : applicationModel // ignore: cast_nullable_to_non_nullable
              as ApplicationModel,
      jobModel: null == jobModel
          ? _value.jobModel
          : jobModel // ignore: cast_nullable_to_non_nullable
              as JobModel,
      applicantModel: null == applicantModel
          ? _value.applicantModel
          : applicantModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApplicationModelCopyWith<$Res> get applicationModel {
    return $ApplicationModelCopyWith<$Res>(_value.applicationModel, (value) {
      return _then(_value.copyWith(applicationModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $JobModelCopyWith<$Res> get jobModel {
    return $JobModelCopyWith<$Res>(_value.jobModel, (value) {
      return _then(_value.copyWith(jobModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get applicantModel {
    return $UserModelCopyWith<$Res>(_value.applicantModel, (value) {
      return _then(_value.copyWith(applicantModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MergedJobPostManageModelCopyWith<$Res>
    implements $MergedJobPostManageModelCopyWith<$Res> {
  factory _$$_MergedJobPostManageModelCopyWith(
          _$_MergedJobPostManageModel value,
          $Res Function(_$_MergedJobPostManageModel) then) =
      __$$_MergedJobPostManageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApplicationModel applicationModel,
      JobModel jobModel,
      UserModel applicantModel});

  @override
  $ApplicationModelCopyWith<$Res> get applicationModel;
  @override
  $JobModelCopyWith<$Res> get jobModel;
  @override
  $UserModelCopyWith<$Res> get applicantModel;
}

/// @nodoc
class __$$_MergedJobPostManageModelCopyWithImpl<$Res>
    extends _$MergedJobPostManageModelCopyWithImpl<$Res,
        _$_MergedJobPostManageModel>
    implements _$$_MergedJobPostManageModelCopyWith<$Res> {
  __$$_MergedJobPostManageModelCopyWithImpl(_$_MergedJobPostManageModel _value,
      $Res Function(_$_MergedJobPostManageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationModel = null,
    Object? jobModel = null,
    Object? applicantModel = null,
  }) {
    return _then(_$_MergedJobPostManageModel(
      applicationModel: null == applicationModel
          ? _value.applicationModel
          : applicationModel // ignore: cast_nullable_to_non_nullable
              as ApplicationModel,
      jobModel: null == jobModel
          ? _value.jobModel
          : jobModel // ignore: cast_nullable_to_non_nullable
              as JobModel,
      applicantModel: null == applicantModel
          ? _value.applicantModel
          : applicantModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_MergedJobPostManageModel
    with DiagnosticableTreeMixin
    implements _MergedJobPostManageModel {
  const _$_MergedJobPostManageModel(
      {required this.applicationModel,
      required this.jobModel,
      required this.applicantModel});

  @override
  final ApplicationModel applicationModel;
  @override
  final JobModel jobModel;
  @override
  final UserModel applicantModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MergedJobPostManageModel(applicationModel: $applicationModel, jobModel: $jobModel, applicantModel: $applicantModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MergedJobPostManageModel'))
      ..add(DiagnosticsProperty('applicationModel', applicationModel))
      ..add(DiagnosticsProperty('jobModel', jobModel))
      ..add(DiagnosticsProperty('applicantModel', applicantModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MergedJobPostManageModel &&
            (identical(other.applicationModel, applicationModel) ||
                other.applicationModel == applicationModel) &&
            (identical(other.jobModel, jobModel) ||
                other.jobModel == jobModel) &&
            (identical(other.applicantModel, applicantModel) ||
                other.applicantModel == applicantModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, applicationModel, jobModel, applicantModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MergedJobPostManageModelCopyWith<_$_MergedJobPostManageModel>
      get copyWith => __$$_MergedJobPostManageModelCopyWithImpl<
          _$_MergedJobPostManageModel>(this, _$identity);
}

abstract class _MergedJobPostManageModel implements MergedJobPostManageModel {
  const factory _MergedJobPostManageModel(
      {required final ApplicationModel applicationModel,
      required final JobModel jobModel,
      required final UserModel applicantModel}) = _$_MergedJobPostManageModel;

  @override
  ApplicationModel get applicationModel;
  @override
  JobModel get jobModel;
  @override
  UserModel get applicantModel;
  @override
  @JsonKey(ignore: true)
  _$$_MergedJobPostManageModelCopyWith<_$_MergedJobPostManageModel>
      get copyWith => throw _privateConstructorUsedError;
}
