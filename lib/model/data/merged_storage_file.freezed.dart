// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merged_storage_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MergedStorageFile {
  Map<String, String>? get customMetadata => throw _privateConstructorUsedError;
  Uint8List? get rawData => throw _privateConstructorUsedError;
  String? get downloadUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MergedStorageFileCopyWith<MergedStorageFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MergedStorageFileCopyWith<$Res> {
  factory $MergedStorageFileCopyWith(
          MergedStorageFile value, $Res Function(MergedStorageFile) then) =
      _$MergedStorageFileCopyWithImpl<$Res, MergedStorageFile>;
  @useResult
  $Res call(
      {Map<String, String>? customMetadata,
      Uint8List? rawData,
      String? downloadUrl});
}

/// @nodoc
class _$MergedStorageFileCopyWithImpl<$Res, $Val extends MergedStorageFile>
    implements $MergedStorageFileCopyWith<$Res> {
  _$MergedStorageFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customMetadata = freezed,
    Object? rawData = freezed,
    Object? downloadUrl = freezed,
  }) {
    return _then(_value.copyWith(
      customMetadata: freezed == customMetadata
          ? _value.customMetadata
          : customMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      rawData: freezed == rawData
          ? _value.rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MergedStorageFileCopyWith<$Res>
    implements $MergedStorageFileCopyWith<$Res> {
  factory _$$_MergedStorageFileCopyWith(_$_MergedStorageFile value,
          $Res Function(_$_MergedStorageFile) then) =
      __$$_MergedStorageFileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, String>? customMetadata,
      Uint8List? rawData,
      String? downloadUrl});
}

/// @nodoc
class __$$_MergedStorageFileCopyWithImpl<$Res>
    extends _$MergedStorageFileCopyWithImpl<$Res, _$_MergedStorageFile>
    implements _$$_MergedStorageFileCopyWith<$Res> {
  __$$_MergedStorageFileCopyWithImpl(
      _$_MergedStorageFile _value, $Res Function(_$_MergedStorageFile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customMetadata = freezed,
    Object? rawData = freezed,
    Object? downloadUrl = freezed,
  }) {
    return _then(_$_MergedStorageFile(
      customMetadata: freezed == customMetadata
          ? _value._customMetadata
          : customMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      rawData: freezed == rawData
          ? _value.rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MergedStorageFile
    with DiagnosticableTreeMixin
    implements _MergedStorageFile {
  const _$_MergedStorageFile(
      {required final Map<String, String>? customMetadata,
      required this.rawData,
      required this.downloadUrl})
      : _customMetadata = customMetadata;

  final Map<String, String>? _customMetadata;
  @override
  Map<String, String>? get customMetadata {
    final value = _customMetadata;
    if (value == null) return null;
    if (_customMetadata is EqualUnmodifiableMapView) return _customMetadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final Uint8List? rawData;
  @override
  final String? downloadUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MergedStorageFile(customMetadata: $customMetadata, rawData: $rawData, downloadUrl: $downloadUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MergedStorageFile'))
      ..add(DiagnosticsProperty('customMetadata', customMetadata))
      ..add(DiagnosticsProperty('rawData', rawData))
      ..add(DiagnosticsProperty('downloadUrl', downloadUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MergedStorageFile &&
            const DeepCollectionEquality()
                .equals(other._customMetadata, _customMetadata) &&
            const DeepCollectionEquality().equals(other.rawData, rawData) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_customMetadata),
      const DeepCollectionEquality().hash(rawData),
      downloadUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MergedStorageFileCopyWith<_$_MergedStorageFile> get copyWith =>
      __$$_MergedStorageFileCopyWithImpl<_$_MergedStorageFile>(
          this, _$identity);
}

abstract class _MergedStorageFile implements MergedStorageFile {
  const factory _MergedStorageFile(
      {required final Map<String, String>? customMetadata,
      required final Uint8List? rawData,
      required final String? downloadUrl}) = _$_MergedStorageFile;

  @override
  Map<String, String>? get customMetadata;
  @override
  Uint8List? get rawData;
  @override
  String? get downloadUrl;
  @override
  @JsonKey(ignore: true)
  _$$_MergedStorageFileCopyWith<_$_MergedStorageFile> get copyWith =>
      throw _privateConstructorUsedError;
}
