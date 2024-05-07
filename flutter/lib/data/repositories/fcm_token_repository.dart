import '../models/save_fcm_token_request/save_fcm_token_request.dart';
import '../network/apis/fcm_token_api.dart';

import '../models/success_response/success_response.dart';

class FcmTokenRepository {
  // AuthApi instance
  final FcmTokenApi fcmTokenApi;
  // injecting dio instance
  FcmTokenRepository({
    required this.fcmTokenApi,
  });

  Future<SuccessResponse> saveFcmTokenToServer(
    SaveFcmTokenRequest saveFcmTokenRequest,
  ) async {
    try {
      final response =
          await fcmTokenApi.saveFcmTokenToServer(saveFcmTokenRequest);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
