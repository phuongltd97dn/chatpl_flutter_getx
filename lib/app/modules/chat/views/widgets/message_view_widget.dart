import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/material.dart';

class MessageViewWidget extends StatelessWidget {
  final String msg;
  final bool isUser;
  final bool isAnimate;
  final Function()? onLoadingFinished;
  const MessageViewWidget({
    Key? key,
    this.msg = '',
    this.isUser = true,
    this.isAnimate = false,
    this.onLoadingFinished,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
            margin: isUser
                ? EdgeInsets.only(left: 28.w)
                : EdgeInsets.only(right: 28.w),
            decoration: BoxDecoration(
              color: isUser ? AppColors.primaryColor : AppColors.secondaryColor,
              borderRadius: isUser
                  ? BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                      bottomLeft: Radius.circular(12.r),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                      bottomRight: Radius.circular(12.r),
                    ),
            ),
            child: isAnimate && !isUser
                ? DefaultTextStyle(
                    style: AppTextStyle.text14BlackW400,
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TyperAnimatedText(
                          msg.trim(),
                          speed: const Duration(milliseconds: 100),
                        )
                      ],
                      onFinished: onLoadingFinished,
                    ))
                : Text(msg,
                    style: AppTextStyle.text14BlackW400.copyWith(
                      color:
                          isUser ? AppColors.whiteColor : AppColors.blackColor,
                    )),
          ),
        ),
      ],
    );
  }
}
