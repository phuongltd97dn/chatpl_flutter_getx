import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/material.dart';

class BaseCheckboxWidget extends StatelessWidget {
  final bool isSelected;
  final Function(bool? value)? onChanged;
  const BaseCheckboxWidget({
    Key? key,
    this.isSelected = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.w,
      height: 24.w,
      child: Checkbox(
        shape: const CircleBorder(),
        side: BorderSide(color: AppColors.primaryColor, width: 1.5.w),
        activeColor: AppColors.primaryColor,
        value: isSelected,
        onChanged: onChanged,
      ),
    );
  }
}
