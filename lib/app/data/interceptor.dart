import 'dart:async';
import 'dart:convert';

import 'package:chat_pl/app/common/util/exports.dart';
import 'package:chat_pl/app/data/errors/api_error.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

FutureOr interceptor(
  GetHttpClient httpClient,
  Request request,
  Response<Object?> response,
) {
  Utils.closeDialog();

  Get.printInfo(
    info: '\nStatus Code: ${response.statusCode}'
        '\nToken: ${response.bodyString?.toString() ?? ''}',
  );

  final status = response.status;

  if (status.connectionError) {
    showError(ApiError(
      type: ErrorType.noConnection,
      error: Strings.noConnection,
    ));
  }

  try {
    final res = jsonDecode(response.bodyString!);

    if (response.isOk) {
      return response;
    } else {
      if (status.isServerError) {
        showError(ApiError(
          type: ErrorType.unknownError,
          error: Strings.unknownError,
        ));
      } else if (status.code == HttpStatus.requestTimeout) {
        showError(ApiError(
          type: ErrorType.connectTimeout,
          error: Strings.connectionTimeout,
        ));
      } else if (response.unauthorized) {
        showError(ApiError(
          type: ErrorType.unauthorize,
          error: res["message"]?.toString() ?? Strings.unauthorize,
        ));
      } else {
        showError(ApiError(
          type: ErrorType.response,
          error: res["message"]?.toString() ?? Strings.unknownError,
        ));
      }
    }
  } on FormatException {
    showError(ApiError(
      type: ErrorType.unknownError,
      error: Strings.unknownError,
    ));
  } on TimeoutException catch (e) {
    showError(ApiError(
      type: ErrorType.connectTimeout,
      error: e.message?.toString() ?? Strings.connectionTimeout,
    ));
  }
}

showError(ApiError error) {
  return throw (error.message);
}
