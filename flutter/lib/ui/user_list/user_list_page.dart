import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import '../../change_notifiers/fcm_call_change_notifier.dart';
import '../../constants/endpoints.dart';
import '../../data/enums/api_request_state.dart';
import '../../data/models/get_users_response/get_users_response_data_user.dart';
import 'package:provider/provider.dart';

import '../../change_notifiers/auth_change_notifier.dart';
// import '../../change_notifiers/fcm_token_change_notifier.dart';
import '../../change_notifiers/users_change_notifier.dart';
import '../../data/models/user/user.dart';
import '../../main.dart';

class UserListPage extends HookWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations? t = AppLocalizations.of(context);
    User? user = context.select(
      (AuthChangeNotifier authChangeNotifier) => authChangeNotifier.user,
    );
    /* String? fcmToken = context.select(
      (FcmTokenChangeNotifier fcmTokenChangeNotifier) =>
          fcmTokenChangeNotifier.fcmToken,
    ); */
    List<GetUsersResponseDataUser> userList =
        context.watch<UsersChangeNotifier>().userList;
    ApiRequestState apiRequestState = context.select(
      (FcmCallChangeNotifier fcmCallChangeNotifier) =>
          fcmCallChangeNotifier.apiRequestState,
    );
    String roomName = context.select(
      (FcmCallChangeNotifier fcmCallChangeNotifier) =>
          fcmCallChangeNotifier.roomName,
    );

    useEffect(
      () {
        // https://github.com/rrousselGit/flutter_hooks/issues/153
        // https://www.faqcode4u.com/faq/370106/flutter-hooks-fetching-data-using-useeffect-setstate-or-markneedsbuild-called-during-build
        Future.microtask(
          () async => await context.read<UsersChangeNotifier>().getUsers(),
        );
        return null;
      },
      const [],
    );

    void joinRoom(String roomName) {
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

    useEffect(
      () {
        if (apiRequestState.isSuccess && roomName.isNotEmpty) {
          // Create and join room of Jitsi Meet
          joinRoom(roomName);
        }
        return null;
      },
      [apiRequestState, roomName],
    );

    /* void handleAudioCall(BuildContext context, GetUsersResponseDataUser user) {
      // Implement audio call functionality
      logger.d('Initiate audio call to loginId: ${user.userId}');
    } */

    Future<void> handleVideoCall(
      BuildContext context,
      GetUsersResponseDataUser user,
    ) async {
      // Implement video call functionality
      logger.d('Initiate video call to loginId: ${user.userId}');
      await context
          .read<FcmCallChangeNotifier>()
          .createFcmVideoCall(user.userId);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t!.appTitle),
        actions: <Widget>[
          Text(user?.userId ?? ''),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthChangeNotifier>().logout();
            },
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            final user = userList[index];
            return ListTile(
              title: Text(user.userName),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /* IconButton(
                    icon: const Icon(Icons.call),
                    onPressed: () {
                      // Implement audio call functionality
                      handleAudioCall(context, user);
                    },
                  ), */
                  IconButton(
                    icon: const Icon(Icons.videocam),
                    onPressed: () {
                      // Implement video call functionality
                      handleVideoCall(context, user);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
