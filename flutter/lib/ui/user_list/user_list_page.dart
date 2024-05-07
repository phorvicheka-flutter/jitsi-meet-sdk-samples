import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../data/models/get_users_response/get_users_response_data_user.dart';
import 'package:provider/provider.dart';

import '../../change_notifiers/auth_change_notifier.dart';
import '../../change_notifiers/fcm_token_change_notifier.dart';
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
    String? fcmToken = context.select(
      (FcmTokenChangeNotifier fcmTokenChangeNotifier) =>
          fcmTokenChangeNotifier.fcmToken,
    );
    List<GetUsersResponseDataUser> userList =
        context.watch<UsersChangeNotifier>().userList;

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

    void handleAudioCall(BuildContext context, GetUsersResponseDataUser user) {
      // Implement audio call functionality
      logger.d('Initiate audio call to loginId: ${user.userId}');
    }

    void handleVideoCall(BuildContext context, GetUsersResponseDataUser user) {
      // Implement video call functionality
      logger.d('Initiate video call to loginId: ${user.userId}');
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
                  IconButton(
                    icon: const Icon(Icons.call),
                    onPressed: () {
                      // Implement audio call functionality
                      handleAudioCall(context, user);
                    },
                  ),
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
