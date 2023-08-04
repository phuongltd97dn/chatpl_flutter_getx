import 'package:chat_pl/app/data/models/sample_question_model/sample_question_model.dart';
import 'package:chat_pl/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // final ApiHelper _apiHelper = Get.find();

  final TextEditingController messageController = TextEditingController();

  List<SampleQuestionModel> sampleQuestions = [
    SampleQuestionModel(category: 'Physics', questions: [
      'What is the difference between scalar and vector quantities in physics?',
      'Can you explain the concept of Newton\'s three laws of motion?',
    ]),
    SampleQuestionModel(category: 'Flutter', questions: [
      'What is Flutter, and how does it differ from other mobile app development frameworks?',
      'Can you explain the widget tree and how it works in Flutter?',
    ]),
    SampleQuestionModel(category: 'Entertainment', questions: [
      'Tell me a joke.',
      'Who won the Oscar for Best Actor this year?',
      'What are the latest movies released in theaters?',
    ]),
  ];

  RxBool isDisable = true.obs;

  @override
  void onInit() {
    super.onInit();

    messageController.addListener(onMessageTextChanged);
  }

  @override
  void onClose() {
    super.onClose();

    messageController.dispose();
  }

  void onMessageTextChanged() {
    isDisable.value = messageController.text.isEmpty;
  }

  void onSendMessage() {
    if (messageController.text.isNotEmpty) {
      Get.toNamed(
        Routes.chat,
        arguments: {'msg': messageController.text},
      );

      messageController.clear();
    }
  }
}
