import 'dart:convert';

import 'package:chat_pl/app/common/constants.dart';
import 'package:chat_pl/app/common/util/exports.dart';
import 'package:chat_pl/app/data/models/history_model/history_model.dart';
import 'package:chat_pl/app/data/models/message_model/message_model.dart';
import 'package:chat_pl/app/data/models/message_model/message_respoinse_model.dart';
import 'package:chat_pl/app/data/repository/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final ApiHelper _apiHelper = Get.find();

  final TextEditingController messageController = TextEditingController();

  RxList<MessageModel> messages = <MessageModel>[].obs;
  RxBool isDisable = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    addUserMessage();

    messageController.addListener(() {
      isDisable.value = messageController.text.isEmpty;
    });
  }

  @override
  void onClose() {
    super.onClose();
    messageController.dispose();
  }

  void insertMessages(String msg, bool isUser) {
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    messages.insert(
      0,
      MessageModel(
        msg: msg,
        isUser: isUser,
        timestamp: timestamp,
      ),
    );
  }

  void addUserMessage() {
    String? msg = Get.arguments['msg'];

    if (msg != null) {
      isLoading.value = true;
      insertMessages(msg, true);
      postMessage(msg);
    }
  }

  void postMessage(String msg) {
    _apiHelper.postMessage(msg).futureValue((value) {
      final MessageResponse response = MessageResponse.fromJson(value);
      final String? answer = response.choices?.first.message?.content;
      if (answer != null) {
        saveHistory(answer);
        insertMessages(answer, false);
      } else {
        isLoading.value = false;
      }
    }, onError: (e) {
      isLoading.value = false;
      DialogUtil.alert(e.toString());
    });
  }

  void onSendMessage() {
    if (messageController.text.isNotEmpty && !isLoading.value) {
      isLoading.value = true;
      insertMessages(messageController.text, true);
      postMessage(messageController.text);
      messageController.clear();
    }
  }

  void saveHistory(String answer) {
    if (messages.first.isUser == true) {
      String? question = messages.first.msg;
      int timestamp = DateTime.now().millisecondsSinceEpoch;

      HistoryModel history = HistoryModel(
        question: question,
        answer: answer,
        timestamp: timestamp,
      );

      String? historiesJson = Storage.getValue(Constants.historiesKey);
      if (historiesJson != null) {
        List<dynamic> histories = jsonDecode(historiesJson);
        histories.insert(0, history.toJson());
        Storage.saveValue(Constants.historiesKey, jsonEncode(histories));
      } else {
        Storage.saveValue(Constants.historiesKey, jsonEncode([history]));
      }
    }
  }
}
