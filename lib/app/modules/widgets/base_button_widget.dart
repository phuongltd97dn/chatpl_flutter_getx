import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/material.dart';

class BaseButtonWidget extends StatelessWidget {
  final String text;
  final String? prefixIcon;
  final bool isDisable;
  final Function()? onPressed;

  const BaseButtonWidget({
    Key? key,
    required this.text,
    this.prefixIcon,
    this.onPressed,
    this.isDisable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisable ? null : onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.h),
        decoration: BoxDecoration(
          color: isDisable ? AppColors.disableColor : AppColors.primaryColor,
          borderRadius: 20.borderRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null)
              AppImages.svg(
                prefixIcon!,
                color: AppColors.whiteColor,
                width: 18.w,
                height: 18.w,
              ),
            SizedBox(width: 6.w),
            Text(
              text,
              style: AppTextStyle.text15BlackW400.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
