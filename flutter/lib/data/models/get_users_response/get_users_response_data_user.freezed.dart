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
// required int id,
  @JsonKey(name: 'loginId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get userName => throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(name: 'loginId') String userId,
      @JsonKey(name: 'name') String userName});
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
    Object? userId = null,
    Object? userName = null,
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
  $Res call(
      {@JsonKey(name: 'loginId') String userId,
      @JsonKey(name: 'name') String userName});
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
    Object? userId = null,
    Object? userName = null,
  }) {
    return _then(_$GetUsersResponseDataUserImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUsersResponseDataUserImpl implements _GetUsersResponseDataUser {
  _$GetUsersResponseDataUserImpl(
      {@JsonKey(name: 'loginId') required this.userId,
      @JsonKey(name: 'name') required this.userName});

  factory _$GetUsersResponseDataUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUsersResponseDataUserImplFromJson(json);

// required int id,
  @override
  @JsonKey(name: 'loginId')
  final String userId;
  @override
  @JsonKey(name: 'name')
  final String userName;

  @override
  String toString() {
    return 'GetUsersResponseDataUser(userId: $userId, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUsersResponseDataUserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userName);

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
          {@JsonKey(name: 'loginId') required final String userId,
          @JsonKey(name: 'name') required final String userName}) =
      _$GetUsersResponseDataUserImpl;

  factory _GetUsersResponseDataUser.fromJson(Map<String, dynamic> json) =
      _$GetUsersResponseDataUserImpl.fromJson;

  @override // required int id,
  @JsonKey(name: 'loginId')
  String get userId;
  @override
  @JsonKey(name: 'name')
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$$GetUsersResponseDataUserImplCopyWith<_$GetUsersResponseDataUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}
