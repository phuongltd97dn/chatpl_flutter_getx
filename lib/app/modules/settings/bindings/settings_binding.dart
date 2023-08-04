import 'package:chat_pl/app/modules/settings/controllers/feedback_controller.dart';
import 'package:chat_pl/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingsController>(SettingsController());
    Get.put<FeedbackController>(FeedbackController());
  }
}
