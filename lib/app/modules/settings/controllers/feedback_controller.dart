import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class FeedbackController extends GetxController {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  RxBool isDisable = true.obs;

  @override
  void onInit() {
    super.onInit();

    descriptionController.addListener(isDisableSendButton);
    nameController.addListener(isDisableSendButton);
    emailController.addListener(isDisableSendButton);
  }

  @override
  void onClose() {
    super.onClose();

    descriptionController.dispose();
    nameController.dispose();
    emailController.dispose();
  }

  void isDisableSendButton() {
    if (descriptionController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      isDisable.value = false;
    } else {
      isDisable.value = true;
    }
  }
}
