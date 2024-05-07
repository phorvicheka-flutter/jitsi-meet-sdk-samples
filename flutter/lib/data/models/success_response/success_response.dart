import 'package:freezed_annotation/freezed_annotation.dart';

part 'success_response.freezed.dart';
part 'success_response.g.dart';

@freezed
class SuccessResponse with _$SuccessResponse {
  factory SuccessResponse({
    required String result,
  }) = _SuccessResponse;

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessResponseFromJson(json);
}
