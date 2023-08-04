import 'package:chat_pl/app/common/util/exports.dart';
import 'package:chat_pl/app/modules/settings/controllers/feedback_controller.dart';
import 'package:chat_pl/app/modules/settings/views/feedback/widgets/exports.dart';
import 'package:chat_pl/app/modules/settings/views/widgets/exports.dart';
import 'package:chat_pl/app/modules/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.closeKeyboard(),
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        resizeToAvoidBottomInset: false,
        appBar: const AppBarWidget(title: Strings.feedback),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.description,
                      style: AppTextStyle.text16BlackW400.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    DescriptionFieldWidget(
                      controller: controller.descriptionController,
                    ),
                    SizedBox(height: 26.h),
                    Text(
                      Strings.contactInfo,
                      style: AppTextStyle.text16BlackW400.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    InfoFieldWidget(
                      textHint: Strings.nameHint,
                      controller: controller.nameController,
                    ),
                    SizedBox(height: 10.h),
                    InfoFieldWidget(
                      textHint: Strings.emailHint,
                      controller: controller.emailController,
                    ),
                  ],
                ),
              ),
              Obx(
                () => BaseButtonWidget(
                  text: Strings.send,
                  isDisable: controller.isDisable.value,
                  onPressed: () => Get.back(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
