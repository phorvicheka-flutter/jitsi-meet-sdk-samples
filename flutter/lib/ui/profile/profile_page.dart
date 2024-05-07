import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../change_notifiers/auth_change_notifier.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    final AuthChangeNotifier authChangeNotifier =
        context.read<AuthChangeNotifier>();

    return Scaffold(
      appBar: AppBar(
        title: Text(t!.profileTitle),
      ),
      body: Center(child: Text(authChangeNotifier.user?.userId ?? '')),
    );
  }
}
