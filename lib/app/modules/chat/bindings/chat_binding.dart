import 'package:chat_pl/app/modules/chat/controllers/chat_controller.dart';
import 'package:get/get.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ChatController>(ChatController());
  }
}
