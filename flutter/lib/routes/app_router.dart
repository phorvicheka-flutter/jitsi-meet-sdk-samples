import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../change_notifiers/auth_change_notifier.dart';
import 'routes.dart';

class AppRouter {
  late final AuthChangeNotifier authChangeNotifier;
  GoRouter get router => _goRouter;

  AppRouter(this.authChangeNotifier);

  late final GoRouter _goRouter = GoRouter(
    debugLogDiagnostics: kDebugMode,
    routes: $appRoutes,
    initialLocation: const LoginRoute().location,
    // redirect to the login page if the user is not logged in
    redirect: (BuildContext context, GoRouterState state) {
      final String location = state.matchedLocation;
      final bool loggedIn = authChangeNotifier.isLoggedIn;

      // check just the subloc in case there are query parameters
      final String loginLoc = const LoginRoute().location;
      final bool goingToLogin = location == loginLoc;

      // no need to redirect at all
      final String registerLoc = const RegisterRoute().location;
      if (location == registerLoc) {
        return null;
      }

      // the user is not logged in and not headed to /login, they need to login
      if (!loggedIn && !goingToLogin) {
        return LoginRoute(fromPage: location).location;
      }

      // the user is logged in and headed to /login, no need to login again
      if (loggedIn && goingToLogin) {
        // return const HomeRoute().location;
        return const UserListRoute().location;
      }

      // no need to redirect at all
      return null;
    },

    // changes on the listenable will cause the router to refresh it's route
    refreshListenable: authChangeNotifier,
  );

  String getCurrentLocation(BuildContext context) {
    final RouteMatch lastMatch =
        _goRouter.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _goRouter.routerDelegate.currentConfiguration;
    final String currentLocation = matchList.uri.toString();

    return currentLocation;
  }
}
