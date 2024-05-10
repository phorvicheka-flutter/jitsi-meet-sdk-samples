import '../models/fcm_video_call_response/fcm_video_call_response.dart';
import '../network/apis/fcm_call_api.dart';

class FcmCallRepository {
  // AuthApi instance
  final FcmCallApi fcmCallApi;
  // injecting dio instance
  FcmCallRepository({
    required this.fcmCallApi,
  });

  Future<FcmVideoCallResponse> createFcmVideoCall(
    String loginId,
  ) async {
    try {
      final response = await fcmCallApi.createFcmVideoCall(loginId);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createFcmVideoTerminate(
    String roomName,
  ) async {
    try {
      await fcmCallApi.createFcmVideoTerminate(roomName);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createFcmVideoRespond({
    required String roomName,
    required bool accept,
  }) async {
    try {
      await fcmCallApi.createFcmVideoRespond(
        roomName: roomName,
        accept: accept,
      );
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
