// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserLoginResponse _$UserLoginResponseFromJson(Map<String, dynamic> json) {
  return _UserLoginResponse.fromJson(json);
}

/// @nodoc
mixin _$UserLoginResponse {
  String get result => throw _privateConstructorUsedError;
  UserLoginResponseData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLoginResponseCopyWith<UserLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLoginResponseCopyWith<$Res> {
  factory $UserLoginResponseCopyWith(
          UserLoginResponse value, $Res Function(UserLoginResponse) then) =
      _$UserLoginResponseCopyWithImpl<$Res, UserLoginResponse>;
  @useResult
  $Res call({String result, UserLoginResponseData data});

  $UserLoginResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$UserLoginResponseCopyWithImpl<$Res, $Val extends UserLoginResponse>
    implements $UserLoginResponseCopyWith<$Res> {
  _$UserLoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserLoginResponseData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserLoginResponseDataCopyWith<$Res> get data {
    return $UserLoginResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserLoginResponseImplCopyWith<$Res>
    implements $UserLoginResponseCopyWith<$Res> {
  factory _$$UserLoginResponseImplCopyWith(_$UserLoginResponseImpl value,
          $Res Function(_$UserLoginResponseImpl) then) =
      __$$UserLoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String result, UserLoginResponseData data});

  @override
  $UserLoginResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserLoginResponseImplCopyWithImpl<$Res>
    extends _$UserLoginResponseCopyWithImpl<$Res, _$UserLoginResponseImpl>
    implements _$$UserLoginResponseImplCopyWith<$Res> {
  __$$UserLoginResponseImplCopyWithImpl(_$UserLoginResponseImpl _value,
      $Res Function(_$UserLoginResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_$UserLoginResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserLoginResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserLoginResponseImpl implements _UserLoginResponse {
  _$UserLoginResponseImpl({required this.result, required this.data});

  factory _$UserLoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLoginResponseImplFromJson(json);

  @override
  final String result;
  @override
  final UserLoginResponseData data;

  @override
  String toString() {
    return 'UserLoginResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoginResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoginResponseImplCopyWith<_$UserLoginResponseImpl> get copyWith =>
      __$$UserLoginResponseImplCopyWithImpl<_$UserLoginResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLoginResponseImplToJson(
      this,
    );
  }
}

abstract class _UserLoginResponse implements UserLoginResponse {
  factory _UserLoginResponse(
      {required final String result,
      required final UserLoginResponseData data}) = _$UserLoginResponseImpl;

  factory _UserLoginResponse.fromJson(Map<String, dynamic> json) =
      _$UserLoginResponseImpl.fromJson;

  @override
  String get result;
  @override
  UserLoginResponseData get data;
  @override
  @JsonKey(ignore: true)
  _$$UserLoginResponseImplCopyWith<_$UserLoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
