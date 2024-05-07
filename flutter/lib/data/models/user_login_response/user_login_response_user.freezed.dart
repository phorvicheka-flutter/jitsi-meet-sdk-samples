// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_login_response_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserLoginResponseUser _$UserLoginResponseUserFromJson(
    Map<String, dynamic> json) {
  return _UserLoginResponseUser.fromJson(json);
}

/// @nodoc
mixin _$UserLoginResponseUser {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLoginResponseUserCopyWith<UserLoginResponseUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLoginResponseUserCopyWith<$Res> {
  factory $UserLoginResponseUserCopyWith(UserLoginResponseUser value,
          $Res Function(UserLoginResponseUser) then) =
      _$UserLoginResponseUserCopyWithImpl<$Res, UserLoginResponseUser>;
  @useResult
  $Res call({String userId, String userName, String email});
}

/// @nodoc
class _$UserLoginResponseUserCopyWithImpl<$Res,
        $Val extends UserLoginResponseUser>
    implements $UserLoginResponseUserCopyWith<$Res> {
  _$UserLoginResponseUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? email = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLoginResponseUserImplCopyWith<$Res>
    implements $UserLoginResponseUserCopyWith<$Res> {
  factory _$$UserLoginResponseUserImplCopyWith(
          _$UserLoginResponseUserImpl value,
          $Res Function(_$UserLoginResponseUserImpl) then) =
      __$$UserLoginResponseUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String userName, String email});
}

/// @nodoc
class __$$UserLoginResponseUserImplCopyWithImpl<$Res>
    extends _$UserLoginResponseUserCopyWithImpl<$Res,
        _$UserLoginResponseUserImpl>
    implements _$$UserLoginResponseUserImplCopyWith<$Res> {
  __$$UserLoginResponseUserImplCopyWithImpl(_$UserLoginResponseUserImpl _value,
      $Res Function(_$UserLoginResponseUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? email = null,
  }) {
    return _then(_$UserLoginResponseUserImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserLoginResponseUserImpl implements _UserLoginResponseUser {
  _$UserLoginResponseUserImpl(
      {required this.userId, required this.userName, required this.email});

  factory _$UserLoginResponseUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLoginResponseUserImplFromJson(json);

  @override
  final String userId;
  @override
  final String userName;
  @override
  final String email;

  @override
  String toString() {
    return 'UserLoginResponseUser(userId: $userId, userName: $userName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoginResponseUserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userName, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoginResponseUserImplCopyWith<_$UserLoginResponseUserImpl>
      get copyWith => __$$UserLoginResponseUserImplCopyWithImpl<
          _$UserLoginResponseUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLoginResponseUserImplToJson(
      this,
    );
  }
}

abstract class _UserLoginResponseUser implements UserLoginResponseUser {
  factory _UserLoginResponseUser(
      {required final String userId,
      required final String userName,
      required final String email}) = _$UserLoginResponseUserImpl;

  factory _UserLoginResponseUser.fromJson(Map<String, dynamic> json) =
      _$UserLoginResponseUserImpl.fromJson;

  @override
  String get userId;
  @override
  String get userName;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$UserLoginResponseUserImplCopyWith<_$UserLoginResponseUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}
