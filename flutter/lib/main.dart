import 'package:flutter/material.dart';

import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jitsi Meet Flutter SDK Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Jitsi Meet Flutter SDK Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final meetingNameController = TextEditingController(text: "UserName01");
  final jitsiMeet = JitsiMeet();
  void join() {
    var listener = JitsiMeetEventListener(
      conferenceJoined: (url) {
        debugPrint("conferenceJoined: url: $url");
      },
      participantJoined: (email, name, role, participantId) {
        debugPrint(
          "participantJoined: email: $email, name: $name, role: $role, "
          "participantId: $participantId",
        );
      },
      participantLeft: (participantId) async {
        debugPrint("participantLeft - participantId: $participantId");
        jitsiMeet.retrieveParticipantsInfo();
      },
      participantsInfoRetrieved: (participantsInfo) {
        debugPrint(
            "participantsInfoRetrieved: participantsInfo: $participantsInfo");
        // Extract the number of objects in the string
        RegExp exp = RegExp(r'{[^}]*}');
        int length = exp.allMatches(participantsInfo).length;
        debugPrint(
            "participantsInfoRetrieved: participantsInfo length: $length");
        if (length == 1) {
          jitsiMeet.hangUp();
        }
      },
      readyToClose: () {
        debugPrint("readyToClose");
      },
    );

    var isAudioOnly = false;
    // var isAudioOnly = true;
    var options = JitsiMeetConferenceOptions(
      // serverURL: "http://localhost:8000",
      // serverURL: "https://localhost:8443",
      // serverURL: "http://192.168.0.42:8000",
      // serverURL: "https://192.168.0.42:8443",
      serverURL: "https://22e4-118-44-27-227.ngrok-free.app",
      // serverURL: "https://meet.jit.si",
      room: "room01",
      configOverrides: {
        // "startWithAudioMuted": true,
        // if audio only,
        "startAudioOnly": isAudioOnly,
        "startWithVideoMuted": isAudioOnly,
        //
        "hideConferenceSubject": true,
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

        "participants.enabled": false,
        "breakout-rooms.enabled": false,
      },
      // token:
      //     "https://jwt.io/#debugger-io?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250ZXh0Ijp7InVzZXIiOnsiYXZhdGFyIjoiaHR0cHM6L2dyYXZhdGFyLmNvbS9hdmF0YXIvYWJjMTIzIiwibmFtZSI6IkpvaG4gRG9lIiwiZW1haWwiOiJqZG9lQGV4YW1wbGUuY29tIiwiaWQiOiJhYmNkOmExYjJjMy1kNGU1ZjYtMGFiYzEtMjNkZS1hYmNkZWYwMWZlZGNiYSJ9LCJncm91cCI6ImExMjMtMTIzLTQ1Ni03ODkifSwiYXVkIjoiaml0c2kiLCJpc3MiOiJteV9jbGllbnQiLCJzdWIiOiJtZWV0LmppdC5zaSIsInJvb20iOiIqIiwibmJmIjoyNTI0NjA4MDAwLCJleHAiOjI1MjQ2MDgwMDB9.WbtBTvYUOtx-VVLYJPja26H-Af8p-U70jJqmN6vk_Ds",
      /* userInfo: JitsiMeetUserInfo(
          displayName: "Flutter user", email: "user@example.com"), */
      userInfo: JitsiMeetUserInfo(displayName: meetingNameController.text),
    );
    // jitsiMeet.hangUp();
    jitsiMeet.join(options, listener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 250,
              height: 50,
              child: TextField(
                controller: meetingNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter meeting name',
                ),
              ),
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: FilledButton(
                  onPressed: join,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                  ),
                  child: const Text("Join")),
            ),
          ],
        ),
      ),
    );
  }
}
