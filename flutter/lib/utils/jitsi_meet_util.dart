import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import '../../constants/endpoints.dart';

// import '../../change_notifiers/fcm_token_change_notifier.dart';
import 'package:logger/logger.dart';

import '../data/models/user/user.dart';

var logger = Logger();

abstract class JitsiMeetUtil {
  static void joinRoom({
    required String roomName,
    User? user,
    void Function()? callbackOnReadyToClose,
  }) {
    final jitsiMeet = JitsiMeet();
    final listener = JitsiMeetEventListener(
      conferenceJoined: (url) {
        debugPrint('conferenceJoined: url: $url');
      },
      participantJoined: (email, name, role, participantId) {
        debugPrint(
          'participantJoined: email: $email, name: $name, role: $role, '
          'participantId: $participantId',
        );
      },
      participantLeft: (participantId) async {
        debugPrint('participantLeft - participantId: $participantId');
        jitsiMeet.retrieveParticipantsInfo();
      },
      participantsInfoRetrieved: (participantsInfo) {
        debugPrint(
          'participantsInfoRetrieved: participantsInfo: $participantsInfo',
        );
        // Extract the number of objects in the string
        RegExp exp = RegExp(r'{[^}]*}');
        int length = exp.allMatches(participantsInfo).length;
        debugPrint(
          'participantsInfoRetrieved: participantsInfo length: $length',
        );
        if (length == 1) {
          jitsiMeet.hangUp();
        }
      },
      readyToClose: () {
        debugPrint('readyToClose');
        if (callbackOnReadyToClose != null) {
          callbackOnReadyToClose();
        }
      },
    );

    var isAudioOnly = false;
    // var isAudioOnly = true;
    var options = JitsiMeetConferenceOptions(
      // serverURL: "http://localhost:8000",
      // serverURL: "https://localhost:8443",
      // serverURL: "http://192.168.0.42:8000",
      // serverURL: "https://192.168.0.42:8443",
      // serverURL: "https://41c6-118-44-27-227.ngrok-free.app",
      serverURL: Endpoints.jitsiMeetServerUrl,
      // serverURL: "https://meet.jit.si",
      room: roomName,
      configOverrides: {
        // "startWithAudioMuted": true,
        // if audio only,
        'startAudioOnly': isAudioOnly,
        'startWithVideoMuted': isAudioOnly,
        //
        'hideConferenceSubject': true,
        // "subject": "JitsiwithFlutter",
        // "localSubject": "localJitsiwithFlutter",
        // "prejoinConfig": {
        //   "enabled": false,
        // }
      },
      featureFlags: {
        // FeatureFlags.welcomePageEnabled: true,
        // FeatureFlags.audioFocusDisabled: true,
        FeatureFlags.addPeopleEnabled: false,
        // FeatureFlags.audioMuteButtonEnabled: false,
        FeatureFlags.audioOnlyButtonEnabled: false,
        FeatureFlags.calenderEnabled: false,
        FeatureFlags.callIntegrationEnabled: false,
        // FeatureFlags.carModeEnabled: false,
        FeatureFlags.closeCaptionsEnabled: false,
        // FeatureFlags.conferenceTimerEnabled: false,
        FeatureFlags.chatEnabled: false,
        FeatureFlags.filmstripEnabled: false,
        FeatureFlags.fullScreenEnabled: false,
        FeatureFlags.helpButtonEnabled: false,
        FeatureFlags.inviteEnabled: false,
        FeatureFlags.androidScreenSharingEnabled: false,
        FeatureFlags.speakerStatsEnabled: false,
        FeatureFlags.kickOutEnabled: false,
        FeatureFlags.liveStreamingEnabled: false,
        FeatureFlags.lobbyModeEnabled: false,
        FeatureFlags.meetingNameEnabled: false,
        FeatureFlags.meetingPasswordEnabled: false,
        FeatureFlags.notificationEnabled: false,
        FeatureFlags.overflowMenuEnabled: false,
        // FeatureFlags.pipEnabled: false,
        // FeatureFlags.pipWhileScreenSharingEnabled: true,
        FeatureFlags.preJoinPageEnabled: false,
        // FeatureFlags.preJoinPageHideDisplayName: true,
        FeatureFlags.raiseHandEnabled: false,
        FeatureFlags.reactionsEnabled: false,
        FeatureFlags.recordingEnabled: false,
        // FeatureFlags.replaceParticipant: true,
        FeatureFlags.securityOptionEnabled: false,
        FeatureFlags.serverUrlChangeEnabled: false,
        FeatureFlags.settingsEnabled: false,
        FeatureFlags.tileViewEnabled: false,
        // if audio only, videoMuteEnabled: false
        FeatureFlags.videoMuteEnabled: !isAudioOnly,
        //
        FeatureFlags.videoShareEnabled: false,
        // FeatureFlags.toolboxEnabled: false, // all buttons and conferenceTimerEnabled
        FeatureFlags.toolboxAlwaysVisible: true,
        // FeatureFlags.resolution: 'unset',
        // FeatureFlags.unsafeRoomWarningEnabled: true,
        // FeatureFlags.iosRecordingEnabled: true,
        // FeatureFlags.iosScreenSharingEnabled: true,

        'participants.enabled': false,
        'breakout-rooms.enabled': false,
      },
      // token:
      //     "https://jwt.io/#debugger-io?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250ZXh0Ijp7InVzZXIiOnsiYXZhdGFyIjoiaHR0cHM6L2dyYXZhdGFyLmNvbS9hdmF0YXIvYWJjMTIzIiwibmFtZSI6IkpvaG4gRG9lIiwiZW1haWwiOiJqZG9lQGV4YW1wbGUuY29tIiwiaWQiOiJhYmNkOmExYjJjMy1kNGU1ZjYtMGFiYzEtMjNkZS1hYmNkZWYwMWZlZGNiYSJ9LCJncm91cCI6ImExMjMtMTIzLTQ1Ni03ODkifSwiYXVkIjoiaml0c2kiLCJpc3MiOiJteV9jbGllbnQiLCJzdWIiOiJtZWV0LmppdC5zaSIsInJvb20iOiIqIiwibmJmIjoyNTI0NjA4MDAwLCJleHAiOjI1MjQ2MDgwMDB9.WbtBTvYUOtx-VVLYJPja26H-Af8p-U70jJqmN6vk_Ds",
      /* userInfo: JitsiMeetUserInfo(
          displayName: "Flutter user", email: "user@example.com"), */
      userInfo: JitsiMeetUserInfo(displayName: user?.userId),
    );
    // jitsiMeet.hangUp();
    jitsiMeet.join(options, listener);
  }
}
