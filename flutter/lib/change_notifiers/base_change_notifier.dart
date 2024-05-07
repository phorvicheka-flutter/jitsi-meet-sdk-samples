import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../data/enums/api_request_state.dart';
import '../di/components/service_locator.dart';
import '../utils/dio_error_util.dart';
import 'auth_change_notifier.dart';

abstract class BaseChangeNotifier extends ChangeNotifier {
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey;
  var logger = Logger();

  BaseChangeNotifier({
    GlobalKey<ScaffoldMessengerState>? rootScaffoldMessengerKey,
  }) : rootScaffoldMessengerKey = rootScaffoldMessengerKey ??
            getIt<GlobalKey<ScaffoldMessengerState>>();

  ApiRequestState _apiRequestState = ApiRequestState.idle;
  ApiRequestState get apiRequestState => _apiRequestState;
  void setApiRequestState(ApiRequestState apiRequestState) {
    _apiRequestState = apiRequestState;
    notifyListeners();
  }

  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  void showErrorMessage(String errorMessage) {
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      // coverage:ignore-start
      SnackBar(
        content: Text(
          errorMessage,
        ),
        duration: const Duration(seconds: 2),
      ),
      // coverage:ignore-end
    );
    logger.d('showSnackBar: $errorMessage');
  }

  bool get isLoading => _apiRequestState == ApiRequestState.loading;

  Future<bool> sendApiRequest(Future<void> Function() request) async {
    try {
      setApiRequestState(ApiRequestState.loading);
      // Send request to server
      await request();

      setApiRequestState(ApiRequestState.success);
      return true;
    } on DioException catch (e) {
      _handleDioError(e);
      return false;
    } catch (e) {
      // everything else
      rethrow;
    }
  }

  Future<void> _handleDioError(DioException e) async {
    setApiRequestState(ApiRequestState.error);
    final errorMessage = DioErrorUtil.handleError(e);
    setErrorMessage(errorMessage);
    showErrorMessage(errorMessage);
    // HttpStatus.unauthorized: token is required
    // HttpStatus.forbidden: invalid token (token may be expired)
    if ((e.response?.statusCode == HttpStatus.unauthorized ||
        e.response?.statusCode == HttpStatus.forbidden)) {
      // logout user which navigate to login page
      AuthChangeNotifier authChangeNotifier = getIt<AuthChangeNotifier>();
      await authChangeNotifier.logout();
    }
  }
}
