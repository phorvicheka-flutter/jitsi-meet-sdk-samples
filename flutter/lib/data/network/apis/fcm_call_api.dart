import '../../../constants/endpoints.dart';
import '../../models/fcm_video_call_response/fcm_video_call_response.dart';
import '../dio_client.dart';

class FcmCallApi {
  // DioClient instance
  final DioClient dioClient;
  // injecting DioClient instance
  FcmCallApi({
    required this.dioClient,
  });

  Future<FcmVideoCallResponse> createFcmVideoCall(
    String loginId,
  ) async {
    try {
      final responseData = await dioClient.post(
        '${Endpoints.fcmCall}/$loginId',
      );
      return FcmVideoCallResponse.fromJson(responseData);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createFcmVideoTerminate(
    String roomName,
  ) async {
    try {
      await dioClient.delete(
        '${Endpoints.fcmCall}/room/$roomName',
      );
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
