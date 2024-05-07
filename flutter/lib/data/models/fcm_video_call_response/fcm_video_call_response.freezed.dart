// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fcm_video_call_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FcmVideoCallResponse _$FcmVideoCallResponseFromJson(Map<String, dynamic> json) {
  return _FcmVideoCallResponse.fromJson(json);
}

/// @nodoc
mixin _$FcmVideoCallResponse {
  FcmVideoCallResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FcmVideoCallResponseCopyWith<FcmVideoCallResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FcmVideoCallResponseCopyWith<$Res> {
  factory $FcmVideoCallResponseCopyWith(FcmVideoCallResponse value,
          $Res Function(FcmVideoCallResponse) then) =
      _$FcmVideoCallResponseCopyWithImpl<$Res, FcmVideoCallResponse>;
  @useResult
  $Res call({FcmVideoCallResponseData data});

  $FcmVideoCallResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$FcmVideoCallResponseCopyWithImpl<$Res,
        $Val extends FcmVideoCallResponse>
    implements $FcmVideoCallResponseCopyWith<$Res> {
  _$FcmVideoCallResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FcmVideoCallResponseData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FcmVideoCallResponseDataCopyWith<$Res> get data {
    return $FcmVideoCallResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FcmVideoCallResponseImplCopyWith<$Res>
    implements $FcmVideoCallResponseCopyWith<$Res> {
  factory _$$FcmVideoCallResponseImplCopyWith(_$FcmVideoCallResponseImpl value,
          $Res Function(_$FcmVideoCallResponseImpl) then) =
      __$$FcmVideoCallResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FcmVideoCallResponseData data});

  @override
  $FcmVideoCallResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$FcmVideoCallResponseImplCopyWithImpl<$Res>
    extends _$FcmVideoCallResponseCopyWithImpl<$Res, _$FcmVideoCallResponseImpl>
    implements _$$FcmVideoCallResponseImplCopyWith<$Res> {
  __$$FcmVideoCallResponseImplCopyWithImpl(_$FcmVideoCallResponseImpl _value,
      $Res Function(_$FcmVideoCallResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$FcmVideoCallResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FcmVideoCallResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FcmVideoCallResponseImpl implements _FcmVideoCallResponse {
  _$FcmVideoCallResponseImpl({required this.data});

  factory _$FcmVideoCallResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FcmVideoCallResponseImplFromJson(json);

  @override
  final FcmVideoCallResponseData data;

  @override
  String toString() {
    return 'FcmVideoCallResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FcmVideoCallResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FcmVideoCallResponseImplCopyWith<_$FcmVideoCallResponseImpl>
      get copyWith =>
          __$$FcmVideoCallResponseImplCopyWithImpl<_$FcmVideoCallResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FcmVideoCallResponseImplToJson(
      this,
    );
  }
}

abstract class _FcmVideoCallResponse implements FcmVideoCallResponse {
  factory _FcmVideoCallResponse(
          {required final FcmVideoCallResponseData data}) =
      _$FcmVideoCallResponseImpl;

  factory _FcmVideoCallResponse.fromJson(Map<String, dynamic> json) =
      _$FcmVideoCallResponseImpl.fromJson;

  @override
  FcmVideoCallResponseData get data;
  @override
  @JsonKey(ignore: true)
  _$$FcmVideoCallResponseImplCopyWith<_$FcmVideoCallResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
