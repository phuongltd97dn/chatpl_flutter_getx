import 'package:chat_pl/app/common/util/exports.dart';
import 'package:chat_pl/app/modules/home/controllers/home_controller.dart';
import 'package:chat_pl/app/modules/home/views/widgets/home_appbar_widget.dart';
import 'package:chat_pl/app/modules/home/views/widgets/sample_question_widget.dart';
import 'package:chat_pl/app/modules/widgets/base_container_widget.dart';
import 'package:chat_pl/app/modules/widgets/message_input_widget.dart';
import 'package:chat_pl/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          HomeAppbarWidget(
            onSetting: () => Get.toNamed(Routes.settings),
            onHistory: () => Get.toNamed(Routes.history),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: BaseContainerWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    Strings.sampleQuestionsLabel,
                    style: AppTextStyle.text16BlackW400,
                  ),
                  SizedBox(height: 18.h),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: controller.sampleQuestions.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 18.h);
                      },
                      itemBuilder: (_, index) {
                        return SampleQuestionWidget(
                          question: controller.sampleQuestions[index],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 26.h),
                  Obx(
                    () => MessageInputWidget(
                      textEditingController: controller.messageController,
                      onSendMessage: controller.onSendMessage,
                      onSubmitted: (_) => controller.onSendMessage(),
                      isDisable: controller.isDisable.value,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
