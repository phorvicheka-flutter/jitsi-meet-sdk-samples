import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/home/home_page.dart';
import '../ui/login/login_page.dart';
import '../ui/outgoing_call/outgoing_call_page.dart';
import '../ui/profile/profile_page.dart';
import '../ui/register/register_page.dart';
import '../ui/user_list/user_list_page.dart';

part 'routes.g.dart';

const pathHome = '/';
const pathProfile = '/profile';
const pathLogin = '/login';
const pathRegister = '/register';
const pathUserList = '/userList';
const pathOutgoingCall = '/outgoingCall';

@TypedGoRoute<HomeRoute>(
  path: pathHome,
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@TypedGoRoute<UserListRoute>(
  path: pathUserList,
)
class UserListRoute extends GoRouteData {
  const UserListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const UserListPage();
}

@TypedGoRoute<ProflieRoute>(
  path: pathProfile,
)
class ProflieRoute extends GoRouteData {
  const ProflieRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfilePage();
}

@TypedGoRoute<LoginRoute>(
  path: pathLogin,
)
class LoginRoute extends GoRouteData {
  const LoginRoute({this.fromPage});

  final String? fromPage;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LoginPage(from: fromPage);
}

@TypedGoRoute<RegisterRoute>(
  path: pathRegister,
)
class RegisterRoute extends GoRouteData {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => RegisterPage();
}

@TypedGoRoute<OutgoinCallRoute>(
  path: pathOutgoingCall,
)
class OutgoinCallRoute extends GoRouteData {
  const OutgoinCallRoute({
    required this.roomName,
    required this.calleeName,
    this.calleeAvatar,
  });

  final String roomName;
  final String calleeName;
  final String? calleeAvatar;

  @override
  Widget build(BuildContext context, GoRouterState state) => OutgoingCallPage(
        roomName: roomName,
        calleeName: calleeName,
        calleeAvatar: calleeAvatar,
      );
}
