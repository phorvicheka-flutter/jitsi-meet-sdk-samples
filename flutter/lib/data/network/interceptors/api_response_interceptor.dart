import 'dart:io';

import 'package:dio/dio.dart';

class ApiResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    switch (response.statusCode) {
      case HttpStatus.ok:
        try {
          final responseBodyData = response.data['data'];
          /* final responseBodyMessage = response.data['message'];
          final responseBodyResult = response.data['result']; */

          // case: fail - modify response status code from 'ok' 200 to 'error' 401 or reject (throw error)
          /* if (responseBodyResult == 'fail' && responseBodyMessage != null) {
            final responseBodyErrorCode = response.data['errorCode'];
            if (responseBodyErrorCode != null &&
                responseBodyErrorCode == HttpStatus.unauthorized) {
              // modify response status code from 'ok' 200 to 'error' 401 - HttpStatus.unauthorized
              return handler.resolve(
                Response(
                  requestOptions: response.requestOptions,
                  statusCode: HttpStatus.unauthorized,
                  data: response.data,
                ),
              );
            } else {
              handler.reject(
                DioException(
                  requestOptions: response.requestOptions,
                  error: responseBodyMessage.toString(),
                ),
              );
            }
          }

          // case: success - keep only {String result, Data? data} for the response body
          if (responseBodyResult == 'success') {
            response.data = {
              'result': responseBodyResult,
              'data': responseBodyData,
            };
            return handler.next(response);
          } */

          response.data = {
            'data': responseBodyData,
          };
          return handler.next(response);
        } catch (e) {
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              error: e.toString(),
            ),
          );
        }

        break;
      default:
        return super.onResponse(response, handler);
    }
  }
}
