// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_login_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserLoginRequest _$UserLoginRequestFromJson(Map<String, dynamic> json) {
  return _UserLoginRequest.fromJson(json);
}

/// @nodoc
mixin _$UserLoginRequest {
  String get userId => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLoginRequestCopyWith<UserLoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLoginRequestCopyWith<$Res> {
  factory $UserLoginRequestCopyWith(
          UserLoginRequest value, $Res Function(UserLoginRequest) then) =
      _$UserLoginRequestCopyWithImpl<$Res, UserLoginRequest>;
  @useResult
  $Res call({String userId, String password});
}

/// @nodoc
class _$UserLoginRequestCopyWithImpl<$Res, $Val extends UserLoginRequest>
    implements $UserLoginRequestCopyWith<$Res> {
  _$UserLoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLoginRequestImplCopyWith<$Res>
    implements $UserLoginRequestCopyWith<$Res> {
  factory _$$UserLoginRequestImplCopyWith(_$UserLoginRequestImpl value,
          $Res Function(_$UserLoginRequestImpl) then) =
      __$$UserLoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String password});
}

/// @nodoc
class __$$UserLoginRequestImplCopyWithImpl<$Res>
    extends _$UserLoginRequestCopyWithImpl<$Res, _$UserLoginRequestImpl>
    implements _$$UserLoginRequestImplCopyWith<$Res> {
  __$$UserLoginRequestImplCopyWithImpl(_$UserLoginRequestImpl _value,
      $Res Function(_$UserLoginRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? password = null,
  }) {
    return _then(_$UserLoginRequestImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserLoginRequestImpl implements _UserLoginRequest {
  _$UserLoginRequestImpl({required this.userId, required this.password});

  factory _$UserLoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLoginRequestImplFromJson(json);

  @override
  final String userId;
  @override
  final String password;

  @override
  String toString() {
    return 'UserLoginRequest(userId: $userId, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoginRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoginRequestImplCopyWith<_$UserLoginRequestImpl> get copyWith =>
      __$$UserLoginRequestImplCopyWithImpl<_$UserLoginRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLoginRequestImplToJson(
      this,
    );
  }
}

abstract class _UserLoginRequest implements UserLoginRequest {
  factory _UserLoginRequest(
      {required final String userId,
      required final String password}) = _$UserLoginRequestImpl;

  factory _UserLoginRequest.fromJson(Map<String, dynamic> json) =
      _$UserLoginRequestImpl.fromJson;

  @override
  String get userId;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$UserLoginRequestImplCopyWith<_$UserLoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
