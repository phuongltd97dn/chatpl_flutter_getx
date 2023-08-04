import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/material.dart';

class InfoFieldWidget extends StatelessWidget {
  final String textHint;
  final TextEditingController? controller;
  const InfoFieldWidget({
    Key? key,
    required this.textHint,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      cursorRadius: Radius.circular(4.r),
      cursorWidth: 1.w,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: textHint,
        hintStyle: AppTextStyle.text14BlackW400.copyWith(
          color: AppColors.textHintColor,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 18.w,
          vertical: 10.h,
        ),
        fillColor: AppColors.whiteColor,
        border: OutlineInputBorder(borderRadius: 8.borderRadius),
      ),
    );
  }
}
