// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merged_manage_job_post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MergedManageJobPostModel {
  ApplicationModel get applicationModel => throw _privateConstructorUsedError;
  JobModel get jobModel => throw _privateConstructorUsedError;
  UserModel get applicantModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MergedManageJobPostModelCopyWith<MergedManageJobPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MergedManageJobPostModelCopyWith<$Res> {
  factory $MergedManageJobPostModelCopyWith(MergedManageJobPostModel value,
          $Res Function(MergedManageJobPostModel) then) =
      _$MergedManageJobPostModelCopyWithImpl<$Res, MergedManageJobPostModel>;
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
class _$MergedManageJobPostModelCopyWithImpl<$Res,
        $Val extends MergedManageJobPostModel>
    implements $MergedManageJobPostModelCopyWith<$Res> {
  _$MergedManageJobPostModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_MergedManageJobPostModelCopyWith<$Res>
    implements $MergedManageJobPostModelCopyWith<$Res> {
  factory _$$_MergedManageJobPostModelCopyWith(
          _$_MergedManageJobPostModel value,
          $Res Function(_$_MergedManageJobPostModel) then) =
      __$$_MergedManageJobPostModelCopyWithImpl<$Res>;
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
class __$$_MergedManageJobPostModelCopyWithImpl<$Res>
    extends _$MergedManageJobPostModelCopyWithImpl<$Res,
        _$_MergedManageJobPostModel>
    implements _$$_MergedManageJobPostModelCopyWith<$Res> {
  __$$_MergedManageJobPostModelCopyWithImpl(_$_MergedManageJobPostModel _value,
      $Res Function(_$_MergedManageJobPostModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationModel = null,
    Object? jobModel = null,
    Object? applicantModel = null,
  }) {
    return _then(_$_MergedManageJobPostModel(
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

class _$_MergedManageJobPostModel
    with DiagnosticableTreeMixin
    implements _MergedManageJobPostModel {
  const _$_MergedManageJobPostModel(
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
    return 'MergedManageJobPostModel(applicationModel: $applicationModel, jobModel: $jobModel, applicantModel: $applicantModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MergedManageJobPostModel'))
      ..add(DiagnosticsProperty('applicationModel', applicationModel))
      ..add(DiagnosticsProperty('jobModel', jobModel))
      ..add(DiagnosticsProperty('applicantModel', applicantModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MergedManageJobPostModel &&
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
  _$$_MergedManageJobPostModelCopyWith<_$_MergedManageJobPostModel>
      get copyWith => __$$_MergedManageJobPostModelCopyWithImpl<
          _$_MergedManageJobPostModel>(this, _$identity);
}

abstract class _MergedManageJobPostModel implements MergedManageJobPostModel {
  const factory _MergedManageJobPostModel(
      {required final ApplicationModel applicationModel,
      required final JobModel jobModel,
      required final UserModel applicantModel}) = _$_MergedManageJobPostModel;

  @override
  ApplicationModel get applicationModel;
  @override
  JobModel get jobModel;
  @override
  UserModel get applicantModel;
  @override
  @JsonKey(ignore: true)
  _$$_MergedManageJobPostModelCopyWith<_$_MergedManageJobPostModel>
      get copyWith => throw _privateConstructorUsedError;
}
