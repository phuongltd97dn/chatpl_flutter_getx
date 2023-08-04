import 'dart:io';

import 'package:chat_pl/app/common/values/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtil {
  static BuildContext? alertContext;
  static String defaultTitle = Strings.notification;

  static Future<T?> alert<T>(
    dynamic content, {
    Function? onSubmit,
    String? title,
    String? submit,
    bool? barrierDismissible,
  }) {
    if (Platform.isIOS) {
      return showCupertinoDialog(
        context: Get.context!, useRootNavigator: false,
        barrierDismissible:
            barrierDismissible ?? false, // user must tap button!
        builder: (BuildContext context) {
          alertContext = context;
          return _alert(
            content,
            onSubmit: onSubmit,
            title: title,
            submit: submit,
          );
        },
      );
    }
    return showDialog<T>(
      context: Get.context!,
      barrierDismissible: barrierDismissible ?? false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          title: title?.isNotEmpty == true ? Text(title!) : Text(defaultTitle),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text(submit ?? 'Đóng'),
              onPressed: () {
                Get.back();
                if (onSubmit != null) {
                  onSubmit();
                }
              },
            )
          ],
        );
      },
    );
  }

  static _alert(
    dynamic content, {
    Function? onSubmit,
    String? title,
    String? submit,
  }) {
    return CupertinoAlertDialog(
      title: title?.isNotEmpty == true ? Text(title ?? '') : Text(defaultTitle),
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(submit ?? 'Đóng'),
          onPressed: () {
            Get.back();
            if (onSubmit != null) {
              onSubmit();
            }
          },
        )
      ],
    );
  }
}
