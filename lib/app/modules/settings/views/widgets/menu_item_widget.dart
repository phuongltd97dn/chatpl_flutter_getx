import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String text;
  final String icon;
  final Function()? onTap;
  const MenuItemWidget({
    Key? key,
    required this.text,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 6.h, bottom: 6.h, left: 10.w),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: 10.borderRadius,
          boxShadow: const [
            BoxShadow(
              color: AppColors.boxShadowColor,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImages.svg(
              icon,
              width: 24.sp,
              height: 24.sp,
            ),
            SizedBox(width: 6.w),
            Text(
              text,
              style: AppTextStyle.text14BlackW400.copyWith(
                color: AppColors.settingsTextColor,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.primaryColor,
              size: 24.sp,
            )
          ],
        ),
      ),
    );
  }
}
