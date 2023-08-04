import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  const Utils._();

  static void showDialog(
    String? message, {
    String title = Strings.error,
    bool success = false,
    VoidCallback? onTap,
  }) =>
      Get.defaultDialog(
        barrierDismissible: false,
        onWillPop: () async {
          Get.back();
          onTap?.call();
          return true;
        },
        title: success ? Strings.success : title,
        content: Text(
          message ?? Strings.somethingWentWrong,
          textAlign: TextAlign.center,
          maxLines: 6,
          style: AppTextStyle.semiBoldStyle.copyWith(
            fontSize: Dimens.fontSize16,
          ),
        ),
        confirm: const Align(
          alignment: Alignment.centerRight,
          child: SizedBox(width: 0.0, height: 0.0),
        ),
      );

  static void closeDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  static void showSnackbar(String? message) {
    closeSnackbar();

    Get.rawSnackbar(message: message);
  }

  static void closeSnackbar() {
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
  }

  static void loadingDialog() {
    Utils.closeDialog();

    Get.dialog(
      Center(
        child: Container(
          padding: EdgeInsets.all(22.w),
          decoration:
              BoxDecoration(color: Colors.white, borderRadius: 10.borderRadius),
          child: const CupertinoActivityIndicator(),
        ),
      ),
    );
  }

  static void closeKeyboard() {
    final currentFocus = Get.focusScope!;
    if (currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
