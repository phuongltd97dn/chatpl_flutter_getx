import 'package:chat_pl/app/data/errors/api_error.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiInterfaceController extends GetxController {
  ApiError? error;
  VoidCallback? retry;

  void onRetryTap() {
    error = null;
    retry?.call();
    update();
  }
}
