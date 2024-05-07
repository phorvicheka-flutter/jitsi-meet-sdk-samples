import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/internet_connection_util.dart';

class NetworkCheckInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler, {
    bool? connected,
  }) async {
    // coverage:ignore-start
    final isConnected = connected ?? await InternetConnectionUtil.isConnected();
    // coverage:ignore-end
    if (isConnected) {
      return super.onRequest(options, handler); // continue
    } else {
      // https://stackoverflow.com/questions/61563074/flutter-localization-without-context
      final locale = PlatformDispatcher.instance.locale;
      AppLocalizations t = await AppLocalizations.delegate.load(locale);
      final errorMessage = t.errorNoInternetConnection;
      handler.reject(
        DioException(
          error: errorMessage,
          requestOptions: options,
        ),
      );
    }
  }
}
