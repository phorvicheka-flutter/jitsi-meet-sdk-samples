// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fcm_video_call_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FcmVideoCallResponseData _$FcmVideoCallResponseDataFromJson(
    Map<String, dynamic> json) {
  return _FcmVideoCallResponseData.fromJson(json);
}

/// @nodoc
mixin _$FcmVideoCallResponseData {
  String get roomName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FcmVideoCallResponseDataCopyWith<FcmVideoCallResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FcmVideoCallResponseDataCopyWith<$Res> {
  factory $FcmVideoCallResponseDataCopyWith(FcmVideoCallResponseData value,
          $Res Function(FcmVideoCallResponseData) then) =
      _$FcmVideoCallResponseDataCopyWithImpl<$Res, FcmVideoCallResponseData>;
  @useResult
  $Res call({String roomName});
}

/// @nodoc
class _$FcmVideoCallResponseDataCopyWithImpl<$Res,
        $Val extends FcmVideoCallResponseData>
    implements $FcmVideoCallResponseDataCopyWith<$Res> {
  _$FcmVideoCallResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomName = null,
  }) {
    return _then(_value.copyWith(
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FcmVideoCallResponseDataImplCopyWith<$Res>
    implements $FcmVideoCallResponseDataCopyWith<$Res> {
  factory _$$FcmVideoCallResponseDataImplCopyWith(
          _$FcmVideoCallResponseDataImpl value,
          $Res Function(_$FcmVideoCallResponseDataImpl) then) =
      __$$FcmVideoCallResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String roomName});
}

/// @nodoc
class __$$FcmVideoCallResponseDataImplCopyWithImpl<$Res>
    extends _$FcmVideoCallResponseDataCopyWithImpl<$Res,
        _$FcmVideoCallResponseDataImpl>
    implements _$$FcmVideoCallResponseDataImplCopyWith<$Res> {
  __$$FcmVideoCallResponseDataImplCopyWithImpl(
      _$FcmVideoCallResponseDataImpl _value,
      $Res Function(_$FcmVideoCallResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomName = null,
  }) {
    return _then(_$FcmVideoCallResponseDataImpl(
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FcmVideoCallResponseDataImpl implements _FcmVideoCallResponseData {
  _$FcmVideoCallResponseDataImpl({required this.roomName});

  factory _$FcmVideoCallResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FcmVideoCallResponseDataImplFromJson(json);

  @override
  final String roomName;

  @override
  String toString() {
    return 'FcmVideoCallResponseData(roomName: $roomName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FcmVideoCallResponseDataImpl &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, roomName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FcmVideoCallResponseDataImplCopyWith<_$FcmVideoCallResponseDataImpl>
      get copyWith => __$$FcmVideoCallResponseDataImplCopyWithImpl<
          _$FcmVideoCallResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FcmVideoCallResponseDataImplToJson(
      this,
    );
  }
}

abstract class _FcmVideoCallResponseData implements FcmVideoCallResponseData {
  factory _FcmVideoCallResponseData({required final String roomName}) =
      _$FcmVideoCallResponseDataImpl;

  factory _FcmVideoCallResponseData.fromJson(Map<String, dynamic> json) =
      _$FcmVideoCallResponseDataImpl.fromJson;

  @override
  String get roomName;
  @override
  @JsonKey(ignore: true)
  _$$FcmVideoCallResponseDataImplCopyWith<_$FcmVideoCallResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
