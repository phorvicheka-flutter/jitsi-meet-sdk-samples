// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fcm_notification_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FcmNotificationBody _$FcmNotificationBodyFromJson(Map<String, dynamic> json) {
  return _FcmNotificationBody.fromJson(json);
}

/// @nodoc
mixin _$FcmNotificationBody {
  String? get roomName => throw _privateConstructorUsedError;
  String? get nameCaller => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FcmNotificationBodyCopyWith<FcmNotificationBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FcmNotificationBodyCopyWith<$Res> {
  factory $FcmNotificationBodyCopyWith(
          FcmNotificationBody value, $Res Function(FcmNotificationBody) then) =
      _$FcmNotificationBodyCopyWithImpl<$Res, FcmNotificationBody>;
  @useResult
  $Res call({String? roomName, String? nameCaller});
}

/// @nodoc
class _$FcmNotificationBodyCopyWithImpl<$Res, $Val extends FcmNotificationBody>
    implements $FcmNotificationBodyCopyWith<$Res> {
  _$FcmNotificationBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomName = freezed,
    Object? nameCaller = freezed,
  }) {
    return _then(_value.copyWith(
      roomName: freezed == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String?,
      nameCaller: freezed == nameCaller
          ? _value.nameCaller
          : nameCaller // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FcmNotificationBodyImplCopyWith<$Res>
    implements $FcmNotificationBodyCopyWith<$Res> {
  factory _$$FcmNotificationBodyImplCopyWith(_$FcmNotificationBodyImpl value,
          $Res Function(_$FcmNotificationBodyImpl) then) =
      __$$FcmNotificationBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? roomName, String? nameCaller});
}

/// @nodoc
class __$$FcmNotificationBodyImplCopyWithImpl<$Res>
    extends _$FcmNotificationBodyCopyWithImpl<$Res, _$FcmNotificationBodyImpl>
    implements _$$FcmNotificationBodyImplCopyWith<$Res> {
  __$$FcmNotificationBodyImplCopyWithImpl(_$FcmNotificationBodyImpl _value,
      $Res Function(_$FcmNotificationBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomName = freezed,
    Object? nameCaller = freezed,
  }) {
    return _then(_$FcmNotificationBodyImpl(
      roomName: freezed == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String?,
      nameCaller: freezed == nameCaller
          ? _value.nameCaller
          : nameCaller // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FcmNotificationBodyImpl implements _FcmNotificationBody {
  _$FcmNotificationBodyImpl({this.roomName, this.nameCaller});

  factory _$FcmNotificationBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$FcmNotificationBodyImplFromJson(json);

  @override
  final String? roomName;
  @override
  final String? nameCaller;

  @override
  String toString() {
    return 'FcmNotificationBody(roomName: $roomName, nameCaller: $nameCaller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FcmNotificationBodyImpl &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            (identical(other.nameCaller, nameCaller) ||
                other.nameCaller == nameCaller));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, roomName, nameCaller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FcmNotificationBodyImplCopyWith<_$FcmNotificationBodyImpl> get copyWith =>
      __$$FcmNotificationBodyImplCopyWithImpl<_$FcmNotificationBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FcmNotificationBodyImplToJson(
      this,
    );
  }
}

abstract class _FcmNotificationBody implements FcmNotificationBody {
  factory _FcmNotificationBody(
      {final String? roomName,
      final String? nameCaller}) = _$FcmNotificationBodyImpl;

  factory _FcmNotificationBody.fromJson(Map<String, dynamic> json) =
      _$FcmNotificationBodyImpl.fromJson;

  @override
  String? get roomName;
  @override
  String? get nameCaller;
  @override
  @JsonKey(ignore: true)
  _$$FcmNotificationBodyImplCopyWith<_$FcmNotificationBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
