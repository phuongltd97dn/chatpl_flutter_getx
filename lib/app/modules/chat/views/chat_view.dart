import 'package:chat_pl/app/common/util/exports.dart';
import 'package:chat_pl/app/modules/chat/controllers/chat_controller.dart';
import 'package:chat_pl/app/modules/chat/views/widgets/message_typing_widget.dart';
import 'package:chat_pl/app/modules/chat/views/widgets/message_view_widget.dart';
import 'package:chat_pl/app/modules/widgets/exports.dart';
import 'package:chat_pl/app/modules/widgets/message_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: BaseAppBarWidget(
        backgroundColor: AppColors.primaryColor,
        title: Strings.chatAppBar,
        textColor: AppColors.whiteColor,
        backbuttonColor: AppColors.whiteColor,
      ),
      body: BaseContainerWidget(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.messages.length,
                  separatorBuilder: (_, index) => SizedBox(height: 10.h),
                  itemBuilder: (_, index) {
                    return MessageViewWidget(
                      msg: controller.messages[index].msg ?? '',
                      isUser: controller.messages[index].isUser ?? true,
                      isAnimate: index == 0,
                      onLoadingFinished: () {
                        controller.isLoading.value = false;
                      },
                    );
                  },
                ),
              ),
              if (controller.isLoading.value) ...[
                SizedBox(height: 10.h),
                const MessageTypingWidget(),
              ],
              SizedBox(height: 26.h),
              MessageInputWidget(
                textEditingController: controller.messageController,
                onSendMessage: controller.onSendMessage,
                onSubmitted: (_) => controller.onSendMessage(),
                isDisable: (controller.isDisable.value) ||
                    (controller.isLoading.value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
