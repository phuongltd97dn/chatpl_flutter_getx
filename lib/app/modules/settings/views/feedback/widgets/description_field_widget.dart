import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/material.dart';

class DescriptionFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  const DescriptionFieldWidget({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.top,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        expands: true,
        cursorColor: AppColors.primaryColor,
        cursorRadius: Radius.circular(4.r),
        cursorWidth: 1.w,
        decoration: InputDecoration(
          hintText: Strings.descriptionHint,
          hintStyle: AppTextStyle.text14BlackW400.copyWith(
            color: AppColors.textHintColor,
          ),
          fillColor: AppColors.whiteColor,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 10.h,
          ),
          border: OutlineInputBorder(
            borderRadius: 24.borderRadius,
          ),
        ),
        style: AppTextStyle.text14BlackW400,
      ),
    );
  }
}
