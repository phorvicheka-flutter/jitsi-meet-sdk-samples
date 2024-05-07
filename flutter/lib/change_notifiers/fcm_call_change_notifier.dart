import 'dart:async';

import 'package:flutter_callkit_incoming/entities/call_event.dart';

import '../data/models/fcm_video_call_response/fcm_video_call_response.dart';
import '../data/repositories/fcm_call_repository.dart';
import 'base_change_notifier.dart';

class FcmCallChangeNotifier extends BaseChangeNotifier {
  FcmCallChangeNotifier(this.fcmCallRepository);

  final FcmCallRepository fcmCallRepository;
  String _roomName = '';
  String get roomName => _roomName;

  void setRoomName(String roomName) {
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

  /* -------------------------------- FlutterCallkitIncoming -------------------------------- */
  //Create a listener parameter
  StreamSubscription<CallEvent?>? _callKitEventListener;
  StreamSubscription<CallEvent?>? get callKitEventListener =>
      _callKitEventListener;
  Future<void> setCallKitEventListener(
    StreamSubscription<CallEvent?> callKitEventListener,
  ) async {
    _callKitEventListener = callKitEventListener;
    notifyListeners();
  }

  dynamic _currentCall;
  dynamic get currentCall => _currentCall;
  void setCurrentCall(dynamic currentCall) {
    _currentCall = currentCall;
    notifyListeners();
  }

  bool isInCall() {
    return _currentCall != null;
  }

  void endCall() {
    _currentCall = null;
    notifyListeners();
  }

  void callStarted(dynamic callInfo) {
    setCurrentCall(callInfo);
  }
}
