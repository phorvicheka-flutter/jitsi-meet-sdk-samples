// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_users_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetUsersResponse _$GetUsersResponseFromJson(Map<String, dynamic> json) {
  return _GetUsersResponse.fromJson(json);
}

/// @nodoc
mixin _$GetUsersResponse {
  String get result => throw _privateConstructorUsedError;
  List<GetUsersResponseDataUser> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUsersResponseCopyWith<GetUsersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUsersResponseCopyWith<$Res> {
  factory $GetUsersResponseCopyWith(
          GetUsersResponse value, $Res Function(GetUsersResponse) then) =
      _$GetUsersResponseCopyWithImpl<$Res, GetUsersResponse>;
  @useResult
  $Res call({String result, List<GetUsersResponseDataUser> data});
}

/// @nodoc
class _$GetUsersResponseCopyWithImpl<$Res, $Val extends GetUsersResponse>
    implements $GetUsersResponseCopyWith<$Res> {
  _$GetUsersResponseCopyWithImpl(this._value, this._then);

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
              as List<GetUsersResponseDataUser>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUsersResponseImplCopyWith<$Res>
    implements $GetUsersResponseCopyWith<$Res> {
  factory _$$GetUsersResponseImplCopyWith(_$GetUsersResponseImpl value,
          $Res Function(_$GetUsersResponseImpl) then) =
      __$$GetUsersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String result, List<GetUsersResponseDataUser> data});
}

/// @nodoc
class __$$GetUsersResponseImplCopyWithImpl<$Res>
    extends _$GetUsersResponseCopyWithImpl<$Res, _$GetUsersResponseImpl>
    implements _$$GetUsersResponseImplCopyWith<$Res> {
  __$$GetUsersResponseImplCopyWithImpl(_$GetUsersResponseImpl _value,
      $Res Function(_$GetUsersResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_$GetUsersResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetUsersResponseDataUser>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUsersResponseImpl implements _GetUsersResponse {
  _$GetUsersResponseImpl(
      {required this.result,
      required final List<GetUsersResponseDataUser> data})
      : _data = data;

  factory _$GetUsersResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUsersResponseImplFromJson(json);

  @override
  final String result;
  final List<GetUsersResponseDataUser> _data;
  @override
  List<GetUsersResponseDataUser> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetUsersResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUsersResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, result, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUsersResponseImplCopyWith<_$GetUsersResponseImpl> get copyWith =>
      __$$GetUsersResponseImplCopyWithImpl<_$GetUsersResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUsersResponseImplToJson(
      this,
    );
  }
}

abstract class _GetUsersResponse implements GetUsersResponse {
  factory _GetUsersResponse(
          {required final String result,
          required final List<GetUsersResponseDataUser> data}) =
      _$GetUsersResponseImpl;

  factory _GetUsersResponse.fromJson(Map<String, dynamic> json) =
      _$GetUsersResponseImpl.fromJson;

  @override
  String get result;
  @override
  List<GetUsersResponseDataUser> get data;
  @override
  @JsonKey(ignore: true)
  _$$GetUsersResponseImplCopyWith<_$GetUsersResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
