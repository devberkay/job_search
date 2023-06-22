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
  List<ApplicationModel> get applicationModels =>
      throw _privateConstructorUsedError;
  List<JobModel> get jobModels => throw _privateConstructorUsedError;
  List<UserModel> get applicantModels => throw _privateConstructorUsedError;

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
      {List<ApplicationModel> applicationModels,
      List<JobModel> jobModels,
      List<UserModel> applicantModels});
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
    Object? applicationModels = null,
    Object? jobModels = null,
    Object? applicantModels = null,
  }) {
    return _then(_value.copyWith(
      applicationModels: null == applicationModels
          ? _value.applicationModels
          : applicationModels // ignore: cast_nullable_to_non_nullable
              as List<ApplicationModel>,
      jobModels: null == jobModels
          ? _value.jobModels
          : jobModels // ignore: cast_nullable_to_non_nullable
              as List<JobModel>,
      applicantModels: null == applicantModels
          ? _value.applicantModels
          : applicantModels // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ) as $Val);
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
      {List<ApplicationModel> applicationModels,
      List<JobModel> jobModels,
      List<UserModel> applicantModels});
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
    Object? applicationModels = null,
    Object? jobModels = null,
    Object? applicantModels = null,
  }) {
    return _then(_$_MergedManageJobPostModel(
      applicationModels: null == applicationModels
          ? _value._applicationModels
          : applicationModels // ignore: cast_nullable_to_non_nullable
              as List<ApplicationModel>,
      jobModels: null == jobModels
          ? _value._jobModels
          : jobModels // ignore: cast_nullable_to_non_nullable
              as List<JobModel>,
      applicantModels: null == applicantModels
          ? _value._applicantModels
          : applicantModels // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc

class _$_MergedManageJobPostModel
    with DiagnosticableTreeMixin
    implements _MergedManageJobPostModel {
  const _$_MergedManageJobPostModel(
      {required final List<ApplicationModel> applicationModels,
      required final List<JobModel> jobModels,
      required final List<UserModel> applicantModels})
      : _applicationModels = applicationModels,
        _jobModels = jobModels,
        _applicantModels = applicantModels;

  final List<ApplicationModel> _applicationModels;
  @override
  List<ApplicationModel> get applicationModels {
    if (_applicationModels is EqualUnmodifiableListView)
      return _applicationModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicationModels);
  }

  final List<JobModel> _jobModels;
  @override
  List<JobModel> get jobModels {
    if (_jobModels is EqualUnmodifiableListView) return _jobModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_jobModels);
  }

  final List<UserModel> _applicantModels;
  @override
  List<UserModel> get applicantModels {
    if (_applicantModels is EqualUnmodifiableListView) return _applicantModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicantModels);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MergedManageJobPostModel(applicationModels: $applicationModels, jobModels: $jobModels, applicantModels: $applicantModels)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MergedManageJobPostModel'))
      ..add(DiagnosticsProperty('applicationModels', applicationModels))
      ..add(DiagnosticsProperty('jobModels', jobModels))
      ..add(DiagnosticsProperty('applicantModels', applicantModels));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MergedManageJobPostModel &&
            const DeepCollectionEquality()
                .equals(other._applicationModels, _applicationModels) &&
            const DeepCollectionEquality()
                .equals(other._jobModels, _jobModels) &&
            const DeepCollectionEquality()
                .equals(other._applicantModels, _applicantModels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_applicationModels),
      const DeepCollectionEquality().hash(_jobModels),
      const DeepCollectionEquality().hash(_applicantModels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MergedManageJobPostModelCopyWith<_$_MergedManageJobPostModel>
      get copyWith => __$$_MergedManageJobPostModelCopyWithImpl<
          _$_MergedManageJobPostModel>(this, _$identity);
}

abstract class _MergedManageJobPostModel implements MergedManageJobPostModel {
  const factory _MergedManageJobPostModel(
          {required final List<ApplicationModel> applicationModels,
          required final List<JobModel> jobModels,
          required final List<UserModel> applicantModels}) =
      _$_MergedManageJobPostModel;

  @override
  List<ApplicationModel> get applicationModels;
  @override
  List<JobModel> get jobModels;
  @override
  List<UserModel> get applicantModels;
  @override
  @JsonKey(ignore: true)
  _$$_MergedManageJobPostModelCopyWith<_$_MergedManageJobPostModel>
      get copyWith => throw _privateConstructorUsedError;
}
