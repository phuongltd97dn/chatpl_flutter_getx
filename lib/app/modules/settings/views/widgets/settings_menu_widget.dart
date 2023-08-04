import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/material.dart';

import 'exports.dart';

class SettingsMenuWidget extends StatelessWidget {
  final String title;
  final List<MenuItemWidget> items;

  const SettingsMenuWidget({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h, left: 28.w, right: 28.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: AppTextStyle.text16BlackW400.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          ...items,
        ],
      ),
    );
  }
}
