import 'dart:async';

import 'package:flutter_callkit_incoming/entities/call_event.dart';

import '../data/enums/api_request_state.dart';
import '../data/models/fcm_video_call_response/fcm_video_call_response.dart';
import '../data/models/fcm_video_call_response/fcm_video_call_response_data.dart';
import '../data/repositories/fcm_call_repository.dart';
import 'base_change_notifier.dart';

class FcmCallChangeNotifier extends BaseChangeNotifier {
  FcmCallChangeNotifier(this.fcmCallRepository);

  final FcmCallRepository fcmCallRepository;

  FcmVideoCallResponseData? _fcmVideoCallResponseData;
  FcmVideoCallResponseData? get fcmVideoCallResponseData =>
      _fcmVideoCallResponseData;
  void setFcmVideoCallResponseData(
    FcmVideoCallResponseData fcmVideoCallResponseData,
  ) {
    _fcmVideoCallResponseData = fcmVideoCallResponseData;
    notifyListeners();
  }

  void resetFcmCallChangeNotifier() {
    _fcmVideoCallResponseData = null;
    setApiRequestState(ApiRequestState.idle);
    notifyListeners();
  }

  Future<void> createFcmVideoCall(
    String loginId,
  ) async {
    await sendApiRequest(
      () async {
        FcmVideoCallResponse fcmVideoCallResponse =
            await fcmCallRepository.createFcmVideoCall(loginId);

        setFcmVideoCallResponseData(fcmVideoCallResponse.data);
      },
    );
  }

  Future<void> createFcmVideoTerminate(
    String roomName,
  ) async {
    await sendApiRequest(
      () async {
        await fcmCallRepository.createFcmVideoTerminate(roomName);
        resetFcmCallChangeNotifier();
      },
    );
  }

  Future<void> createFcmVideoRespond({
    required String roomName,
    required bool accept,
  }) async {
    await sendApiRequest(
      () async {
        await fcmCallRepository.createFcmVideoRespond(
          roomName: roomName,
          accept: accept,
        );
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
}
