import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';

class MessageTypingWidget extends StatelessWidget {
  const MessageTypingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r),
            ),
          ),
          child: JumpingDots(
            numberOfDots: 3,
            innerPadding: 2.w,
            radius: 7.r,
            color: AppColors.gray400Color,
            delay: 500,
            verticalOffset: -10,
            animationDuration: const Duration(milliseconds: 280),
          ),
        ),
      ],
    );
  }
}
