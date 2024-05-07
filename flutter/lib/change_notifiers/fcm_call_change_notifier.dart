import '../data/models/fcm_video_call_response/fcm_video_call_response.dart';
import '../data/repositories/fcm_call_repository.dart';
import 'base_change_notifier.dart';

class FcmCallChangeNotifier extends BaseChangeNotifier {
  FcmCallChangeNotifier(this.fcmCallRepository);

  final FcmCallRepository fcmCallRepository;
  String _roomName = '';
  String get roomName => _roomName;

  Future<void> setRoomName(String roomName) async {
    _roomName = roomName;
    notifyListeners();
  }

  Future<void> createFcmVideoCall(
    String loginId,
  ) async {
    await sendApiRequest(
      () async {
        FcmVideoCallResponse fcmVideoCallResponse =
            await fcmCallRepository.createFcmVideoCall(loginId);

        setRoomName(fcmVideoCallResponse.data.roomName);
      },
    );
  }
}
