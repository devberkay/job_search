// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merged_my_applications_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MergedMyApplicationsModel {
  JobModel get jobModel => throw _privateConstructorUsedError;
  ApplicationModel get applicationModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MergedMyApplicationsModelCopyWith<MergedMyApplicationsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MergedMyApplicationsModelCopyWith<$Res> {
  factory $MergedMyApplicationsModelCopyWith(MergedMyApplicationsModel value,
          $Res Function(MergedMyApplicationsModel) then) =
      _$MergedMyApplicationsModelCopyWithImpl<$Res, MergedMyApplicationsModel>;
  @useResult
  $Res call({JobModel jobModel, ApplicationModel applicationModel});

  $JobModelCopyWith<$Res> get jobModel;
  $ApplicationModelCopyWith<$Res> get applicationModel;
}

/// @nodoc
class _$MergedMyApplicationsModelCopyWithImpl<$Res,
        $Val extends MergedMyApplicationsModel>
    implements $MergedMyApplicationsModelCopyWith<$Res> {
  _$MergedMyApplicationsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobModel = null,
    Object? applicationModel = null,
  }) {
    return _then(_value.copyWith(
      jobModel: null == jobModel
          ? _value.jobModel
          : jobModel // ignore: cast_nullable_to_non_nullable
              as JobModel,
      applicationModel: null == applicationModel
          ? _value.applicationModel
          : applicationModel // ignore: cast_nullable_to_non_nullable
              as ApplicationModel,
    ) as $Val);
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
  $ApplicationModelCopyWith<$Res> get applicationModel {
    return $ApplicationModelCopyWith<$Res>(_value.applicationModel, (value) {
      return _then(_value.copyWith(applicationModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MergedMyApplicationsModelCopyWith<$Res>
    implements $MergedMyApplicationsModelCopyWith<$Res> {
  factory _$$_MergedMyApplicationsModelCopyWith(
          _$_MergedMyApplicationsModel value,
          $Res Function(_$_MergedMyApplicationsModel) then) =
      __$$_MergedMyApplicationsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({JobModel jobModel, ApplicationModel applicationModel});

  @override
  $JobModelCopyWith<$Res> get jobModel;
  @override
  $ApplicationModelCopyWith<$Res> get applicationModel;
}

/// @nodoc
class __$$_MergedMyApplicationsModelCopyWithImpl<$Res>
    extends _$MergedMyApplicationsModelCopyWithImpl<$Res,
        _$_MergedMyApplicationsModel>
    implements _$$_MergedMyApplicationsModelCopyWith<$Res> {
  __$$_MergedMyApplicationsModelCopyWithImpl(
      _$_MergedMyApplicationsModel _value,
      $Res Function(_$_MergedMyApplicationsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobModel = null,
    Object? applicationModel = null,
  }) {
    return _then(_$_MergedMyApplicationsModel(
      jobModel: null == jobModel
          ? _value.jobModel
          : jobModel // ignore: cast_nullable_to_non_nullable
              as JobModel,
      applicationModel: null == applicationModel
          ? _value.applicationModel
          : applicationModel // ignore: cast_nullable_to_non_nullable
              as ApplicationModel,
    ));
  }
}

/// @nodoc

class _$_MergedMyApplicationsModel
    with DiagnosticableTreeMixin
    implements _MergedMyApplicationsModel {
  const _$_MergedMyApplicationsModel(
      {required this.jobModel, required this.applicationModel});

  @override
  final JobModel jobModel;
  @override
  final ApplicationModel applicationModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MergedMyApplicationsModel(jobModel: $jobModel, applicationModel: $applicationModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MergedMyApplicationsModel'))
      ..add(DiagnosticsProperty('jobModel', jobModel))
      ..add(DiagnosticsProperty('applicationModel', applicationModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MergedMyApplicationsModel &&
            (identical(other.jobModel, jobModel) ||
                other.jobModel == jobModel) &&
            (identical(other.applicationModel, applicationModel) ||
                other.applicationModel == applicationModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jobModel, applicationModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MergedMyApplicationsModelCopyWith<_$_MergedMyApplicationsModel>
      get copyWith => __$$_MergedMyApplicationsModelCopyWithImpl<
          _$_MergedMyApplicationsModel>(this, _$identity);
}

abstract class _MergedMyApplicationsModel implements MergedMyApplicationsModel {
  const factory _MergedMyApplicationsModel(
          {required final JobModel jobModel,
          required final ApplicationModel applicationModel}) =
      _$_MergedMyApplicationsModel;

  @override
  JobModel get jobModel;
  @override
  ApplicationModel get applicationModel;
  @override
  @JsonKey(ignore: true)
  _$$_MergedMyApplicationsModelCopyWith<_$_MergedMyApplicationsModel>
      get copyWith => throw _privateConstructorUsedError;
}
