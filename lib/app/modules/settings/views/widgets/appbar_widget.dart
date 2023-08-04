import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends PreferredSize {
  final String title;
  const AppBarWidget({Key? key, required this.title})
      : super(
          key: key,
          child: const SizedBox.shrink(),
          preferredSize: const Size.fromHeight(kToolbarHeight),
        );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.secondaryColor,
      title: Text(
        title,
        style: AppTextStyle.text18BlackW400.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back,
          size: 20.sp,
          color: AppColors.primaryColor,
        ),
        splashRadius: 20.sp,
      ),
    );
  }
}
