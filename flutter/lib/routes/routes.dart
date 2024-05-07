import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/home/home_page.dart';
import '../ui/login/login_page.dart';
import '../ui/profile/profile_page.dart';
import '../ui/register/register_page.dart';

part 'routes.g.dart';

const pathHome = '/';
const pathProfile = '/profile';
const pathLogin = '/login';
const pathRegister = '/register';

@TypedGoRoute<HomeRoute>(
  path: pathHome,
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
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
