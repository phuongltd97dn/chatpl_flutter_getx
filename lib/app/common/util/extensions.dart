import 'package:chat_pl/app/common/constants.dart';
import 'package:chat_pl/app/common/util/exports.dart';
import 'package:chat_pl/app/data/errors/api_error.dart';
import 'package:chat_pl/app/data/interface_controller/api_interface_controller.dart';
import 'package:chat_pl/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Extensions {}

extension BorderRadiusExt on num {
  BorderRadius get borderRadius => BorderRadius.circular(r);

  InputBorder outlineInputBorder({
    BorderSide borderSide = BorderSide.none,
  }) =>
      OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: borderSide,
      );

  BorderSide borderSide({
    Color? color,
    double? width,
    BorderStyle? style,
  }) =>
      BorderSide(
        color: color ?? Colors.white,
        width: 0.5,
        style: style ?? BorderStyle.solid,
      );
}

extension FutureExt<T> on Future<Response<T>?> {
  void futureValue(
    Function(T value) response, {
    required Function(String? error)? onError,
  }) {
    final interface = Get.find<ApiInterfaceController>();
    interface.error = null;

    timeout(
      Constants.timeout,
      onTimeout: () {
        Utils.closeDialog();
        Utils.showSnackbar(Strings.connectionTimeout);

        throw ApiError(
            type: ErrorType.connectTimeout, error: Strings.connectionTimeout);
      },
    ).then((value) {
      if (value?.body != null) {
        Utils.closeDialog();
        response(value!.body as T);
      }
      interface.update();
    }).catchError((e) {
      if (e == null) return;

      String errorMsg = (e is ApiError) ? e.message : e.toString();

      if (e is ApiError) {
        if (e.type == ErrorType.connectTimeout ||
            e.type == ErrorType.noConnection) {
          interface.error = e;
        } else {
          Utils.showDialog(
            errorMsg,
            onTap: errorMsg != Strings.unauthorize
                ? null
                : () => Get.offAllNamed(Routes.home),
          );
        }

        if (onError != null) {
          onError(errorMsg);
        }

        printError(info: 'catchError: error: $e\nerrorMessage: $errorMsg');
      }
    });
  }
}
