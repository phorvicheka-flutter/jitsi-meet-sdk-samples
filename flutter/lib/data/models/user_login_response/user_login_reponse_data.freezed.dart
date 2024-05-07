// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_login_reponse_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserLoginResponseData _$UserLoginResponseDataFromJson(
    Map<String, dynamic> json) {
  return _UserLoginResponseData.fromJson(json);
}

/// @nodoc
mixin _$UserLoginResponseData {
// required UserLoginResponseUser user,
  String get token => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get loginId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLoginResponseDataCopyWith<UserLoginResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLoginResponseDataCopyWith<$Res> {
  factory $UserLoginResponseDataCopyWith(UserLoginResponseData value,
          $Res Function(UserLoginResponseData) then) =
      _$UserLoginResponseDataCopyWithImpl<$Res, UserLoginResponseData>;
  @useResult
  $Res call({String token, String id, String loginId, String name});
}

/// @nodoc
class _$UserLoginResponseDataCopyWithImpl<$Res,
        $Val extends UserLoginResponseData>
    implements $UserLoginResponseDataCopyWith<$Res> {
  _$UserLoginResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? id = null,
    Object? loginId = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      loginId: null == loginId
          ? _value.loginId
          : loginId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLoginResponseDataImplCopyWith<$Res>
    implements $UserLoginResponseDataCopyWith<$Res> {
  factory _$$UserLoginResponseDataImplCopyWith(
          _$UserLoginResponseDataImpl value,
          $Res Function(_$UserLoginResponseDataImpl) then) =
      __$$UserLoginResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String id, String loginId, String name});
}

/// @nodoc
class __$$UserLoginResponseDataImplCopyWithImpl<$Res>
    extends _$UserLoginResponseDataCopyWithImpl<$Res,
        _$UserLoginResponseDataImpl>
    implements _$$UserLoginResponseDataImplCopyWith<$Res> {
  __$$UserLoginResponseDataImplCopyWithImpl(_$UserLoginResponseDataImpl _value,
      $Res Function(_$UserLoginResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? id = null,
    Object? loginId = null,
    Object? name = null,
  }) {
    return _then(_$UserLoginResponseDataImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      loginId: null == loginId
          ? _value.loginId
          : loginId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserLoginResponseDataImpl implements _UserLoginResponseData {
  _$UserLoginResponseDataImpl(
      {required this.token,
      required this.id,
      required this.loginId,
      required this.name});

  factory _$UserLoginResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLoginResponseDataImplFromJson(json);

// required UserLoginResponseUser user,
  @override
  final String token;
  @override
  final String id;
  @override
  final String loginId;
  @override
  final String name;

  @override
  String toString() {
    return 'UserLoginResponseData(token: $token, id: $id, loginId: $loginId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoginResponseDataImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.loginId, loginId) || other.loginId == loginId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, id, loginId, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoginResponseDataImplCopyWith<_$UserLoginResponseDataImpl>
      get copyWith => __$$UserLoginResponseDataImplCopyWithImpl<
          _$UserLoginResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLoginResponseDataImplToJson(
      this,
    );
  }
}

abstract class _UserLoginResponseData implements UserLoginResponseData {
  factory _UserLoginResponseData(
      {required final String token,
      required final String id,
      required final String loginId,
      required final String name}) = _$UserLoginResponseDataImpl;

  factory _UserLoginResponseData.fromJson(Map<String, dynamic> json) =
      _$UserLoginResponseDataImpl.fromJson;

  @override // required UserLoginResponseUser user,
  String get token;
  @override
  String get id;
  @override
  String get loginId;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$UserLoginResponseDataImplCopyWith<_$UserLoginResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
