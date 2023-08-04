import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/material.dart';

class MessageInputWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function()? onSendMessage;
  final Function(String? value)? onSubmitted;
  final bool isDisable;
  const MessageInputWidget({
    Key? key,
    required this.textEditingController,
    this.onSendMessage,
    this.onSubmitted,
    this.isDisable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            maxLines: 1,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: AppColors.blackColor,
            cursorWidth: 1.w,
            decoration: InputDecoration(
              fillColor: AppColors.whiteColor,
              hintText: Strings.messageInputHint,
              hintStyle: AppTextStyle.text14BlackW400.copyWith(
                color: AppColors.textHintColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: 0.5.w,
                ),
                borderRadius: 20.borderRadius,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: 0.5.w,
                ),
                borderRadius: 20.borderRadius,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 16.h,
              ),
            ),
            controller: textEditingController,
            textInputAction: TextInputAction.done,
            onSubmitted: onSubmitted,
          ),
        ),
        SizedBox(width: 6.w),
        GestureDetector(
          onTap: isDisable ? null : onSendMessage,
          child: Container(
            width: 52.w,
            height: 52.h,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color:
                  isDisable ? AppColors.disableColor : AppColors.primaryColor,
              borderRadius: 20.borderRadius,
            ),
            child: AppImages.svg(
              AppImages.icSend,
              color: isDisable ? AppColors.secondaryColor : null,
            ),
          ),
        )
      ],
    );
  }
}
