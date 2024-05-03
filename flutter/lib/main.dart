import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:sample_app/application_state.dart';

// Background message handler :
// https://firebase.google.com/docs/cloud-messaging/flutter/receive#background_messages
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  debugPrint("Handling a background message: ${message.messageId}");
  debugPrint(
      'Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp(appState: ApplicationState()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appState});

  final ApplicationState appState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jitsi Meet Flutter SDK Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
          title: 'Jitsi Meet Flutter SDK Sample', appState: appState),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.appState});
  final String title;
  final ApplicationState appState;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final meetingRoomNameController = TextEditingController(text: "Room01");
  final meetingUserNameController = TextEditingController(text: "UserName01");
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
      // serverURL: "https://41c6-118-44-27-227.ngrok-free.app",
      serverURL: "https://dev.connected-in.co.kr:8446",
      // serverURL: "https://meet.jit.si",
      room: meetingRoomNameController.text,
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
      userInfo: JitsiMeetUserInfo(displayName: meetingUserNameController.text),
    );
    // jitsiMeet.hangUp();
    jitsiMeet.join(options, listener);
  }

  // Function to copy FCM token to clipboard
  void _copyTokenToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.appState.fcmToken));
    // Show a snackbar indicating token has been copied
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('FCM Token copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ListenableBuilder(
              listenable: widget.appState,
              builder: (context, child) {
                return Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextField(
                              controller: meetingRoomNameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Room name',
                                hintText: 'Enter room name',
                              ),
                            ),
                            const SizedBox(
                                height: 20.0), // Add spacing between fields
                            TextField(
                              controller: meetingUserNameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'User name',
                                hintText: 'Enter meeting name',
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                              children: [
                                Expanded(
                                  child: FilledButton(
                                      onPressed: join,
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(double.infinity, 50)),
                                      ),
                                      child: const Text(
                                        "Join",
                                        style: TextStyle(fontSize: 20),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Visibility(
                          visible: widget.appState.messagingAllowed,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                        'FCM Token: ${widget.appState.fcmToken}'),
                                    IconButton(
                                      icon: const Icon(Icons
                                          .content_copy), // Icon for copying
                                      onPressed: _copyTokenToClipboard,
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Click the "Subscribe To Weather" button below to subscribe to the'
                                  ' "weather" topic. Messages sent to the weather topic will be'
                                  ' received.',
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    widget.appState.subscribeToTopic('weather'),
                                child: const Text('Subscribe To Weather'),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: !widget.appState.messagingAllowed,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Thi quickstart requires notification permissions to be'
                                  ' activated.',
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => widget.appState
                                    .requestMessagingPermission(),
                                child: const Text(
                                    'Request Notification Permission'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
