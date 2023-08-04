import 'package:chat_pl/app/modules/history/controllers/history_controller.dart';
import 'package:get/get.dart';

class HistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HistoryController>(HistoryController());
  }
}
