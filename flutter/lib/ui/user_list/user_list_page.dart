import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../change_notifiers/fcm_call_change_notifier.dart';
import '../../data/enums/api_request_state.dart';
import '../../data/models/fcm_video_call_response/fcm_video_call_response_data.dart';
import '../../data/models/get_users_response/get_users_response_data_user.dart';
import 'package:provider/provider.dart';

import '../../change_notifiers/auth_change_notifier.dart';
// import '../../change_notifiers/fcm_token_change_notifier.dart';
import '../../change_notifiers/users_change_notifier.dart';
import '../../data/models/user/user.dart';
import '../../routes/routes.dart';
import '../../utils/callkit_incoming_util.dart';
import 'package:logger/logger.dart';

import '../../utils/dialogs_util.dart';
import '../../utils/jitsi_meet_util.dart';

var logger = Logger();

class UserListPage extends HookWidget {
  const UserListPage({super.key});

  static final GlobalKey<State> _globalKeyForLoadingDialog = GlobalKey<State>();
  static final GlobalKey<State> _globalKeyForErrorDialog = GlobalKey<State>();

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
    ApiRequestState apiRequestStateOfFcmCallChangeNotifier = context.select(
      (FcmCallChangeNotifier fcmCallChangeNotifier) =>
          fcmCallChangeNotifier.apiRequestState,
    );
    FcmVideoCallResponseData? fcmVideoCallResponseData = context.select(
      (FcmCallChangeNotifier fcmCallChangeNotifier) =>
          fcmCallChangeNotifier.fcmVideoCallResponseData,
    );

    StreamSubscription<CallEvent?>? callKitEventListener = context.select(
      (FcmCallChangeNotifier fcmCallChangeNotifier) =>
          fcmCallChangeNotifier.callKitEventListener,
    );

    void setCallKitEventListener(
      StreamSubscription<CallEvent?> newCallKitEventListener,
    ) {
      final fcmCallChangeNotifier = context.read<FcmCallChangeNotifier>();
      fcmCallChangeNotifier.setCallKitEventListener(newCallKitEventListener);
    }

    useEffect(
      () {
        // https://github.com/rrousselGit/flutter_hooks/issues/153
        // https://www.faqcode4u.com/faq/370106/flutter-hooks-fetching-data-using-useeffect-setstate-or-markneedsbuild-called-during-build
        Future.microtask(
          () async {
            await context.read<UsersChangeNotifier>().getUsers();

            // #region - init incoming callkit event listener
            // https://github.com/hiennguyen92/flutter_callkit_incoming/issues/189#issuecomment-1443112119
            if (callKitEventListener == null) {
              // initialize listenerEvent of FlutterCallkitIncoming
              var newCallKitEventListener = CallkitIncomingUtil.listenerEvent(
                callbackOnActionCallAccept: (event) {
                  logger.d('callbackOnActionCallAccept');
                  // join room of Jitsi Meet
                  final roomName = event.body['extra']['roomName'];
                  final callId = event.body['id'];
                  if (roomName != null && callId != null) {
                    JitsiMeetUtil.joinRoom(
                      roomName: roomName,
                      user: user,
                      callbackOnReadyToClose: () {
                        CallkitIncomingUtil.endCurrentCall(callId);
                        logger.d(
                          '>>> Called: CallkitIncomingUtil.endCurrentCall.',
                        );
                        // CallkitIncomingUtil.endAllCalls();
                      },
                    );
                  }
                },
                callbackOnActionCallDecline: (event) {
                  logger.d('callbackOnActionCallDecline');
                },
                callbackOnActionCallEnded: (event) {
                  logger.d('callbackOnActionCallEnded');
                },
              );
              if (newCallKitEventListener != null) {
                setCallKitEventListener(newCallKitEventListener);
              }
            } else {
              debugPrint('UserListPage: already have a listener for callkit.');
            }
            // #endregion
          },
        );

        return null;
      },
      const [],
    );

    // Handle API request case: error
    useEffect(
      () {
        if (apiRequestStateOfFcmCallChangeNotifier.isError) {
          final currentContextOfLoadingDialog =
              _globalKeyForLoadingDialog.currentContext;
          if (currentContextOfLoadingDialog != null) {
            Navigator.of(
              currentContextOfLoadingDialog,
            ).pop();
          }
          Future.microtask(
            () => DialogsUtil.showErrorDialog(
              context,
              key: _globalKeyForErrorDialog,
            ),
          );
        }
        return null;
      },
      [apiRequestStateOfFcmCallChangeNotifier],
    );

    // Handle API request case: success
    // On success api request -> fcmVideoCallResponseData is not null
    useEffect(
      () {
        if (fcmVideoCallResponseData != null) {
          final currentContextOfLoadingDialog =
              _globalKeyForLoadingDialog.currentContext;
          if (currentContextOfLoadingDialog != null) {
            // close loading dialog
            Navigator.of(currentContextOfLoadingDialog).pop();
          }
          // Navigate to outgoing call page
          final roomName = fcmVideoCallResponseData.roomName;
          final calleeName = fcmVideoCallResponseData.calleeName;
          // TODO: calleeAvatar
          const calleeAvatar = 'https://i.pravatar.cc/100';
          Future.microtask(
            () => OutgoinCallRoute(
              roomName: roomName,
              calleeName: calleeName,
              calleeAvatar: calleeAvatar,
            ).push(context),
          );

          // TODO: move this code - Create and join room of Jitsi Meet
          // joinRoom only when get fcm push notification - call accepted
          // JitsiMeetUtil.joinRoom(roomName: roomName, user: user);
        }
        return null;
      },
      [fcmVideoCallResponseData],
    );

    /* void handleAudioCall(BuildContext context, GetUsersResponseDataUser user) {
      // Implement audio call functionality
      logger.d('Initiate audio call to loginId: ${user.userId}');
    } */

    Future<void> handleVideoCall(
      BuildContext context,
      GetUsersResponseDataUser user,
    ) async {
      // show the loading dialog
      DialogsUtil.showLoadingDialog(context, key: _globalKeyForLoadingDialog);
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
