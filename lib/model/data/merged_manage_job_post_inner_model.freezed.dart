// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merged_manage_job_post_inner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MergedManageJobPostInnerModel {
  ApplicationModel get applicationModel => throw _privateConstructorUsedError;
  UserModel get applicantModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MergedManageJobPostInnerModelCopyWith<MergedManageJobPostInnerModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MergedManageJobPostInnerModelCopyWith<$Res> {
  factory $MergedManageJobPostInnerModelCopyWith(
          MergedManageJobPostInnerModel value,
          $Res Function(MergedManageJobPostInnerModel) then) =
      _$MergedManageJobPostInnerModelCopyWithImpl<$Res,
          MergedManageJobPostInnerModel>;
  @useResult
  $Res call({ApplicationModel applicationModel, UserModel applicantModel});

  $ApplicationModelCopyWith<$Res> get applicationModel;
  $UserModelCopyWith<$Res> get applicantModel;
}

/// @nodoc
class _$MergedManageJobPostInnerModelCopyWithImpl<$Res,
        $Val extends MergedManageJobPostInnerModel>
    implements $MergedManageJobPostInnerModelCopyWith<$Res> {
  _$MergedManageJobPostInnerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationModel = null,
    Object? applicantModel = null,
  }) {
    return _then(_value.copyWith(
      applicationModel: null == applicationModel
          ? _value.applicationModel
          : applicationModel // ignore: cast_nullable_to_non_nullable
              as ApplicationModel,
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
  $UserModelCopyWith<$Res> get applicantModel {
    return $UserModelCopyWith<$Res>(_value.applicantModel, (value) {
      return _then(_value.copyWith(applicantModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MergedManageJobPostInnerModelCopyWith<$Res>
    implements $MergedManageJobPostInnerModelCopyWith<$Res> {
  factory _$$_MergedManageJobPostInnerModelCopyWith(
          _$_MergedManageJobPostInnerModel value,
          $Res Function(_$_MergedManageJobPostInnerModel) then) =
      __$$_MergedManageJobPostInnerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApplicationModel applicationModel, UserModel applicantModel});

  @override
  $ApplicationModelCopyWith<$Res> get applicationModel;
  @override
  $UserModelCopyWith<$Res> get applicantModel;
}

/// @nodoc
class __$$_MergedManageJobPostInnerModelCopyWithImpl<$Res>
    extends _$MergedManageJobPostInnerModelCopyWithImpl<$Res,
        _$_MergedManageJobPostInnerModel>
    implements _$$_MergedManageJobPostInnerModelCopyWith<$Res> {
  __$$_MergedManageJobPostInnerModelCopyWithImpl(
      _$_MergedManageJobPostInnerModel _value,
      $Res Function(_$_MergedManageJobPostInnerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationModel = null,
    Object? applicantModel = null,
  }) {
    return _then(_$_MergedManageJobPostInnerModel(
      applicationModel: null == applicationModel
          ? _value.applicationModel
          : applicationModel // ignore: cast_nullable_to_non_nullable
              as ApplicationModel,
      applicantModel: null == applicantModel
          ? _value.applicantModel
          : applicantModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_MergedManageJobPostInnerModel
    with DiagnosticableTreeMixin
    implements _MergedManageJobPostInnerModel {
  const _$_MergedManageJobPostInnerModel(
      {required this.applicationModel, required this.applicantModel});

  @override
  final ApplicationModel applicationModel;
  @override
  final UserModel applicantModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MergedManageJobPostInnerModel(applicationModel: $applicationModel, applicantModel: $applicantModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MergedManageJobPostInnerModel'))
      ..add(DiagnosticsProperty('applicationModel', applicationModel))
      ..add(DiagnosticsProperty('applicantModel', applicantModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MergedManageJobPostInnerModel &&
            (identical(other.applicationModel, applicationModel) ||
                other.applicationModel == applicationModel) &&
            (identical(other.applicantModel, applicantModel) ||
                other.applicantModel == applicantModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, applicationModel, applicantModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MergedManageJobPostInnerModelCopyWith<_$_MergedManageJobPostInnerModel>
      get copyWith => __$$_MergedManageJobPostInnerModelCopyWithImpl<
          _$_MergedManageJobPostInnerModel>(this, _$identity);
}

abstract class _MergedManageJobPostInnerModel
    implements MergedManageJobPostInnerModel {
  const factory _MergedManageJobPostInnerModel(
          {required final ApplicationModel applicationModel,
          required final UserModel applicantModel}) =
      _$_MergedManageJobPostInnerModel;

  @override
  ApplicationModel get applicationModel;
  @override
  UserModel get applicantModel;
  @override
  @JsonKey(ignore: true)
  _$$_MergedManageJobPostInnerModelCopyWith<_$_MergedManageJobPostInnerModel>
      get copyWith => throw _privateConstructorUsedError;
}
