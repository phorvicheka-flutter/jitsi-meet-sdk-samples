import '../../../constants/endpoints.dart';
import '../../models/save_fcm_token_request/save_fcm_token_request.dart';
import '../../models/success_response/success_response.dart';
import '../dio_client.dart';

class FcmTokenApi {
  // DioClient instance
  final DioClient dioClient;
  // injecting DioClient instance
  FcmTokenApi({
    required this.dioClient,
  });

  Future<SuccessResponse> saveFcmTokenToServer(
    SaveFcmTokenRequest saveFcmTokenRequest,
  ) async {
    try {
      final responseData = await dioClient.post(
        Endpoints.fcmToken,
        data: saveFcmTokenRequest.toJson(),
      );
      return SuccessResponse.fromJson(responseData);
    } catch (e) {
      rethrow;
    }
  }
}
