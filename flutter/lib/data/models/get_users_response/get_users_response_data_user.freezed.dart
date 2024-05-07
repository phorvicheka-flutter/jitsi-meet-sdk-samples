// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_users_response_data_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetUsersResponseDataUser _$GetUsersResponseDataUserFromJson(
    Map<String, dynamic> json) {
  return _GetUsersResponseDataUser.fromJson(json);
}

/// @nodoc
mixin _$GetUsersResponseDataUser {
  int get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUsersResponseDataUserCopyWith<GetUsersResponseDataUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUsersResponseDataUserCopyWith<$Res> {
  factory $GetUsersResponseDataUserCopyWith(GetUsersResponseDataUser value,
          $Res Function(GetUsersResponseDataUser) then) =
      _$GetUsersResponseDataUserCopyWithImpl<$Res, GetUsersResponseDataUser>;
  @useResult
  $Res call({int id, String userId, String userName, String email});
}

/// @nodoc
class _$GetUsersResponseDataUserCopyWithImpl<$Res,
        $Val extends GetUsersResponseDataUser>
    implements $GetUsersResponseDataUserCopyWith<$Res> {
  _$GetUsersResponseDataUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$GetUsersResponseDataUserImplCopyWith<$Res>
    implements $GetUsersResponseDataUserCopyWith<$Res> {
  factory _$$GetUsersResponseDataUserImplCopyWith(
          _$GetUsersResponseDataUserImpl value,
          $Res Function(_$GetUsersResponseDataUserImpl) then) =
      __$$GetUsersResponseDataUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String userId, String userName, String email});
}

/// @nodoc
class __$$GetUsersResponseDataUserImplCopyWithImpl<$Res>
    extends _$GetUsersResponseDataUserCopyWithImpl<$Res,
        _$GetUsersResponseDataUserImpl>
    implements _$$GetUsersResponseDataUserImplCopyWith<$Res> {
  __$$GetUsersResponseDataUserImplCopyWithImpl(
      _$GetUsersResponseDataUserImpl _value,
      $Res Function(_$GetUsersResponseDataUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? email = null,
  }) {
    return _then(_$GetUsersResponseDataUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$GetUsersResponseDataUserImpl implements _GetUsersResponseDataUser {
  _$GetUsersResponseDataUserImpl(
      {required this.id,
      required this.userId,
      required this.userName,
      required this.email});

  factory _$GetUsersResponseDataUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUsersResponseDataUserImplFromJson(json);

  @override
  final int id;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String email;

  @override
  String toString() {
    return 'GetUsersResponseDataUser(id: $id, userId: $userId, userName: $userName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUsersResponseDataUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, userName, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUsersResponseDataUserImplCopyWith<_$GetUsersResponseDataUserImpl>
      get copyWith => __$$GetUsersResponseDataUserImplCopyWithImpl<
          _$GetUsersResponseDataUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUsersResponseDataUserImplToJson(
      this,
    );
  }
}

abstract class _GetUsersResponseDataUser implements GetUsersResponseDataUser {
  factory _GetUsersResponseDataUser(
      {required final int id,
      required final String userId,
      required final String userName,
      required final String email}) = _$GetUsersResponseDataUserImpl;

  factory _GetUsersResponseDataUser.fromJson(Map<String, dynamic> json) =
      _$GetUsersResponseDataUserImpl.fromJson;

  @override
  int get id;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$GetUsersResponseDataUserImplCopyWith<_$GetUsersResponseDataUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}
