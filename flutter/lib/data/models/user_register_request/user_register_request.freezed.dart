// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRegisterRequest _$UserRegisterRequestFromJson(Map<String, dynamic> json) {
  return _UserRegisterRequest.fromJson(json);
}

/// @nodoc
mixin _$UserRegisterRequest {
  @JsonKey(name: 'loginId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get userName =>
      throw _privateConstructorUsedError; // required String email,
  @JsonKey(name: 'password')
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRegisterRequestCopyWith<UserRegisterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegisterRequestCopyWith<$Res> {
  factory $UserRegisterRequestCopyWith(
          UserRegisterRequest value, $Res Function(UserRegisterRequest) then) =
      _$UserRegisterRequestCopyWithImpl<$Res, UserRegisterRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'loginId') String userId,
      @JsonKey(name: 'name') String userName,
      @JsonKey(name: 'password') String password});
}

/// @nodoc
class _$UserRegisterRequestCopyWithImpl<$Res, $Val extends UserRegisterRequest>
    implements $UserRegisterRequestCopyWith<$Res> {
  _$UserRegisterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRegisterRequestImplCopyWith<$Res>
    implements $UserRegisterRequestCopyWith<$Res> {
  factory _$$UserRegisterRequestImplCopyWith(_$UserRegisterRequestImpl value,
          $Res Function(_$UserRegisterRequestImpl) then) =
      __$$UserRegisterRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'loginId') String userId,
      @JsonKey(name: 'name') String userName,
      @JsonKey(name: 'password') String password});
}

/// @nodoc
class __$$UserRegisterRequestImplCopyWithImpl<$Res>
    extends _$UserRegisterRequestCopyWithImpl<$Res, _$UserRegisterRequestImpl>
    implements _$$UserRegisterRequestImplCopyWith<$Res> {
  __$$UserRegisterRequestImplCopyWithImpl(_$UserRegisterRequestImpl _value,
      $Res Function(_$UserRegisterRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_$UserRegisterRequestImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
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
class _$UserRegisterRequestImpl implements _UserRegisterRequest {
  _$UserRegisterRequestImpl(
      {@JsonKey(name: 'loginId') required this.userId,
      @JsonKey(name: 'name') required this.userName,
      @JsonKey(name: 'password') required this.password});

  factory _$UserRegisterRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRegisterRequestImplFromJson(json);

  @override
  @JsonKey(name: 'loginId')
  final String userId;
  @override
  @JsonKey(name: 'name')
  final String userName;
// required String email,
  @override
  @JsonKey(name: 'password')
  final String password;

  @override
  String toString() {
    return 'UserRegisterRequest(userId: $userId, userName: $userName, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegisterRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userName, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegisterRequestImplCopyWith<_$UserRegisterRequestImpl> get copyWith =>
      __$$UserRegisterRequestImplCopyWithImpl<_$UserRegisterRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRegisterRequestImplToJson(
      this,
    );
  }
}

abstract class _UserRegisterRequest implements UserRegisterRequest {
  factory _UserRegisterRequest(
          {@JsonKey(name: 'loginId') required final String userId,
          @JsonKey(name: 'name') required final String userName,
          @JsonKey(name: 'password') required final String password}) =
      _$UserRegisterRequestImpl;

  factory _UserRegisterRequest.fromJson(Map<String, dynamic> json) =
      _$UserRegisterRequestImpl.fromJson;

  @override
  @JsonKey(name: 'loginId')
  String get userId;
  @override
  @JsonKey(name: 'name')
  String get userName;
  @override // required String email,
  @JsonKey(name: 'password')
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$UserRegisterRequestImplCopyWith<_$UserRegisterRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
