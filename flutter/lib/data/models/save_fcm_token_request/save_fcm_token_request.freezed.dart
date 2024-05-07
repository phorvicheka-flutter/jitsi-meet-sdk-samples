// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_fcm_token_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SaveFcmTokenRequest _$SaveFcmTokenRequestFromJson(Map<String, dynamic> json) {
  return _SaveFcmTokenRequest.fromJson(json);
}

/// @nodoc
mixin _$SaveFcmTokenRequest {
  String get userId => throw _privateConstructorUsedError;
  String get fcmToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaveFcmTokenRequestCopyWith<SaveFcmTokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveFcmTokenRequestCopyWith<$Res> {
  factory $SaveFcmTokenRequestCopyWith(
          SaveFcmTokenRequest value, $Res Function(SaveFcmTokenRequest) then) =
      _$SaveFcmTokenRequestCopyWithImpl<$Res, SaveFcmTokenRequest>;
  @useResult
  $Res call({String userId, String fcmToken});
}

/// @nodoc
class _$SaveFcmTokenRequestCopyWithImpl<$Res, $Val extends SaveFcmTokenRequest>
    implements $SaveFcmTokenRequestCopyWith<$Res> {
  _$SaveFcmTokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? fcmToken = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveFcmTokenRequestImplCopyWith<$Res>
    implements $SaveFcmTokenRequestCopyWith<$Res> {
  factory _$$SaveFcmTokenRequestImplCopyWith(_$SaveFcmTokenRequestImpl value,
          $Res Function(_$SaveFcmTokenRequestImpl) then) =
      __$$SaveFcmTokenRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String fcmToken});
}

/// @nodoc
class __$$SaveFcmTokenRequestImplCopyWithImpl<$Res>
    extends _$SaveFcmTokenRequestCopyWithImpl<$Res, _$SaveFcmTokenRequestImpl>
    implements _$$SaveFcmTokenRequestImplCopyWith<$Res> {
  __$$SaveFcmTokenRequestImplCopyWithImpl(_$SaveFcmTokenRequestImpl _value,
      $Res Function(_$SaveFcmTokenRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? fcmToken = null,
  }) {
    return _then(_$SaveFcmTokenRequestImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaveFcmTokenRequestImpl implements _SaveFcmTokenRequest {
  _$SaveFcmTokenRequestImpl({required this.userId, required this.fcmToken});

  factory _$SaveFcmTokenRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveFcmTokenRequestImplFromJson(json);

  @override
  final String userId;
  @override
  final String fcmToken;

  @override
  String toString() {
    return 'SaveFcmTokenRequest(userId: $userId, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveFcmTokenRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, fcmToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveFcmTokenRequestImplCopyWith<_$SaveFcmTokenRequestImpl> get copyWith =>
      __$$SaveFcmTokenRequestImplCopyWithImpl<_$SaveFcmTokenRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveFcmTokenRequestImplToJson(
      this,
    );
  }
}

abstract class _SaveFcmTokenRequest implements SaveFcmTokenRequest {
  factory _SaveFcmTokenRequest(
      {required final String userId,
      required final String fcmToken}) = _$SaveFcmTokenRequestImpl;

  factory _SaveFcmTokenRequest.fromJson(Map<String, dynamic> json) =
      _$SaveFcmTokenRequestImpl.fromJson;

  @override
  String get userId;
  @override
  String get fcmToken;
  @override
  @JsonKey(ignore: true)
  _$$SaveFcmTokenRequestImplCopyWith<_$SaveFcmTokenRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
