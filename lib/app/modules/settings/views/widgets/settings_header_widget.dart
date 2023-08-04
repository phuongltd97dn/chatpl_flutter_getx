import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class SettingsHeaderWidget extends StatelessWidget {
  const SettingsHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 36.h),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50.r),
        ),
      ),
      child: Container(
        height: 200.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: 50.borderRadius,
          image: const DecorationImage(
            image: Svg(AppImages.settingsHeader, color: AppColors.blackColor),
          ),
        ),
      ),
    );
  }
}
