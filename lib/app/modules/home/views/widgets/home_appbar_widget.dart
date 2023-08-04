import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/material.dart';

class HomeAppbarWidget extends StatelessWidget {
  final Function()? onSetting;
  final Function()? onHistory;

  const HomeAppbarWidget({
    Key? key,
    this.onSetting,
    this.onHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200.h,
          child: AppImages.svg(AppImages.homeBg, fit: BoxFit.fitWidth),
        ),
        Padding(
          padding: EdgeInsets.only(top: 58.h, left: 36.w, right: 36.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: AppImages.svg(
                      AppImages.icHamburger,
                      width: 24.w,
                      height: 24.h,
                    ),
                    onPressed: onSetting,
                  ),
                  IconButton(
                    icon: AppImages.svg(
                      AppImages.icHistoric,
                      width: 24.w,
                      height: 24.h,
                    ),
                    onPressed: onHistory,
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Text(
                Strings.welcomeTo,
                style: AppTextStyle.text28BlackW400.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                Strings.aiAssist,
                style: AppTextStyle.text34BlackW600.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
