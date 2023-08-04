import 'package:chat_pl/app/modules/chat/bindings/chat_binding.dart';
import 'package:chat_pl/app/modules/chat/views/chat_view.dart';
import 'package:chat_pl/app/modules/history/bindings/history_binding.dart';
import 'package:chat_pl/app/modules/history/views/history_view.dart';
import 'package:chat_pl/app/modules/home/bindings/home_binding.dart';
import 'package:chat_pl/app/modules/home/views/home_view.dart';
import 'package:chat_pl/app/modules/settings/bindings/settings_binding.dart';
import 'package:chat_pl/app/modules/settings/views/settings_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  const AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.chat,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.history,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
