// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRegisterResponse _$UserRegisterResponseFromJson(Map<String, dynamic> json) {
  return _UserRegisterResponse.fromJson(json);
}

/// @nodoc
mixin _$UserRegisterResponse {
  String get id => throw _privateConstructorUsedError;
  dynamic get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRegisterResponseCopyWith<UserRegisterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegisterResponseCopyWith<$Res> {
  factory $UserRegisterResponseCopyWith(UserRegisterResponse value,
          $Res Function(UserRegisterResponse) then) =
      _$UserRegisterResponseCopyWithImpl<$Res, UserRegisterResponse>;
  @useResult
  $Res call({String id, dynamic version});
}

/// @nodoc
class _$UserRegisterResponseCopyWithImpl<$Res,
        $Val extends UserRegisterResponse>
    implements $UserRegisterResponseCopyWith<$Res> {
  _$UserRegisterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? version = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRegisterResponseImplCopyWith<$Res>
    implements $UserRegisterResponseCopyWith<$Res> {
  factory _$$UserRegisterResponseImplCopyWith(_$UserRegisterResponseImpl value,
          $Res Function(_$UserRegisterResponseImpl) then) =
      __$$UserRegisterResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, dynamic version});
}

/// @nodoc
class __$$UserRegisterResponseImplCopyWithImpl<$Res>
    extends _$UserRegisterResponseCopyWithImpl<$Res, _$UserRegisterResponseImpl>
    implements _$$UserRegisterResponseImplCopyWith<$Res> {
  __$$UserRegisterResponseImplCopyWithImpl(_$UserRegisterResponseImpl _value,
      $Res Function(_$UserRegisterResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? version = freezed,
  }) {
    return _then(_$UserRegisterResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRegisterResponseImpl implements _UserRegisterResponse {
  _$UserRegisterResponseImpl({required this.id, this.version});

  factory _$UserRegisterResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRegisterResponseImplFromJson(json);

  @override
  final String id;
  @override
  final dynamic version;

  @override
  String toString() {
    return 'UserRegisterResponse(id: $id, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegisterResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.version, version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(version));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegisterResponseImplCopyWith<_$UserRegisterResponseImpl>
      get copyWith =>
          __$$UserRegisterResponseImplCopyWithImpl<_$UserRegisterResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRegisterResponseImplToJson(
      this,
    );
  }
}

abstract class _UserRegisterResponse implements UserRegisterResponse {
  factory _UserRegisterResponse(
      {required final String id,
      final dynamic version}) = _$UserRegisterResponseImpl;

  factory _UserRegisterResponse.fromJson(Map<String, dynamic> json) =
      _$UserRegisterResponseImpl.fromJson;

  @override
  String get id;
  @override
  dynamic get version;
  @override
  @JsonKey(ignore: true)
  _$$UserRegisterResponseImplCopyWith<_$UserRegisterResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
