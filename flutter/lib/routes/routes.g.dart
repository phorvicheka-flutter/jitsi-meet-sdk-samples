// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $userListRoute,
      $proflieRoute,
      $loginRoute,
      $registerRoute,
      $outgoinCallRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userListRoute => GoRouteData.$route(
      path: '/userList',
      factory: $UserListRouteExtension._fromState,
    );

extension $UserListRouteExtension on UserListRoute {
  static UserListRoute _fromState(GoRouterState state) => const UserListRoute();

  String get location => GoRouteData.$location(
        '/userList',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $proflieRoute => GoRouteData.$route(
      path: '/profile',
      factory: $ProflieRouteExtension._fromState,
    );

extension $ProflieRouteExtension on ProflieRoute {
  static ProflieRoute _fromState(GoRouterState state) => const ProflieRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute(
        fromPage: state.uri.queryParameters['from-page'],
      );

  String get location => GoRouteData.$location(
        '/login',
        queryParams: {
          if (fromPage != null) 'from-page': fromPage,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerRoute => GoRouteData.$route(
      path: '/register',
      factory: $RegisterRouteExtension._fromState,
    );

extension $RegisterRouteExtension on RegisterRoute {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  String get location => GoRouteData.$location(
        '/register',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $outgoinCallRoute => GoRouteData.$route(
      path: '/outgoingCall',
      factory: $OutgoinCallRouteExtension._fromState,
    );

extension $OutgoinCallRouteExtension on OutgoinCallRoute {
  static OutgoinCallRoute _fromState(GoRouterState state) => OutgoinCallRoute(
        roomName: state.uri.queryParameters['room-name']!,
        calleeName: state.uri.queryParameters['callee-name']!,
        calleeAvatar: state.uri.queryParameters['callee-avatar'],
      );

  String get location => GoRouteData.$location(
        '/outgoingCall',
        queryParams: {
          'room-name': roomName,
          'callee-name': calleeName,
          if (calleeAvatar != null) 'callee-avatar': calleeAvatar,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
