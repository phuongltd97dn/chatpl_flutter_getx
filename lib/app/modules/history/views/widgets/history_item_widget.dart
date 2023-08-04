import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/material.dart';

class HistoryItemWidget extends StatelessWidget {
  final String? datetime;
  final String? question;
  final Function()? onTap;

  const HistoryItemWidget({
    Key? key,
    this.datetime,
    this.question,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: 16.borderRadius,
          boxShadow: [
            BoxShadow(
              color: AppColors.boxShadowColor,
              blurRadius: 4.r,
              offset: const Offset(0, 2),
              spreadRadius: 0.r,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    datetime ?? '',
                    style: AppTextStyle.text12BlackW400.copyWith(
                      color: AppColors.tertiaryColor,
                    ),
                  ),
                  Text(
                    question ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.text14BlackW400,
                  ),
                ],
              ),
            ),
            SizedBox(width: 24.w),
            Icon(
              Icons.chevron_right_rounded,
              size: 24.w,
              color: AppColors.tertiaryColor,
            )
          ],
        ),
      ),
    );
  }
}
