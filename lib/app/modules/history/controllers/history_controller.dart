import 'dart:convert';

import 'package:chat_pl/app/common/constants.dart';
import 'package:chat_pl/app/common/util/exports.dart';
import 'package:chat_pl/app/data/models/history_model/history_model.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  RxBool isMultiSelect = false.obs;
  RxList<HistoryModel> histories = <HistoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchHistoriesData();
  }

  void fetchHistoriesData() {
    String? historiesJson = Storage.getValue(Constants.historiesKey);

    if (historiesJson != null) {
      List<dynamic> historiesList = jsonDecode(historiesJson);
      List<HistoryModel> data = historiesList
          .map((history) => HistoryModel.fromJson(history))
          .toList();

      histories.addAll(data);
    }
  }

  void toggleMultiSelect() {
    if (isMultiSelect.value) {
      for (var history in histories) {
        history.isSelected = false;
      }
      histories.refresh();
    }

    isMultiSelect.value = !isMultiSelect.value;
  }

  void onCheckboxChanged(int index, bool? value) {
    histories[index].isSelected = value ?? false;
    histories.refresh();
  }

  bool checkDisableButton() {
    bool checkSelected = histories.every((history) {
      return history.isSelected == false;
    });

    if (checkSelected) return true;

    return false;
  }

  void deleteHistories() {
    histories.removeWhere((history) => history.isSelected);
    histories.refresh();
    Storage.saveValue(Constants.historiesKey, jsonEncode(histories));
  }

  void deleteHistory(HistoryModel? history) {
    if (history != null) {
      histories.removeWhere(
        (e) {
          return history.question == e.question && history.answer == e.answer;
        },
      );
      histories.refresh();
      Storage.saveValue(Constants.historiesKey, jsonEncode(histories));

      Get.back();
    }
  }
}
