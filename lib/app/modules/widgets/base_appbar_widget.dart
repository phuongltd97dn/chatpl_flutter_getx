import 'package:chat_pl/app/common/util/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

class BaseAppBarWidget extends PreferredSize {
  final String? title;
  final Color? backgroundColor, backbuttonColor, textColor;
  final TextStyle? textStyle;
  final List<Widget>? actions;
  final Function()? onActionButtonTap, onBackPress;
  final double? actionButtonWidth;
  final Widget? titleWidget, leading, bottom;
  final bool addBackButton;
  final bool? centerTitle;
  final double? titleSpacing;
  final double? elevation;
  final VoidCallback? onPressedLeading;

  BaseAppBarWidget({
    Key? key,
    this.title,
    this.elevation,
    this.titleWidget,
    this.leading,
    this.addBackButton = true,
    this.onBackPress,
    this.backgroundColor = Colors.white,
    this.backbuttonColor = Colors.black,
    this.textColor = Colors.black,
    this.textStyle,
    this.actions,
    this.onActionButtonTap,
    this.actionButtonWidth = 100,
    this.bottom,
    this.centerTitle,
    this.titleSpacing,
    this.onPressedLeading,
  })  : assert(
          textColor == null || textStyle == null,
          'Cannot provide both a textColor and a textStyle\n'
          'To provide both, use "textStyle: TextStyle(color: color)".',
        ),
        super(
          key: key,
          child: const SizedBox.shrink(),
          preferredSize: Size.fromHeight(
            bottom == null ? kToolbarHeight : 98.h,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle ?? true,
      elevation: elevation ?? 0,
      titleSpacing: titleSpacing,
      actions: actions,
      actionsIconTheme: IconThemeData(size: 20.w),
      bottom: bottom == null
          ? null
          : PreferredSize(
              preferredSize: Size.fromHeight(100.h),
              child: bottom!,
            ),
      leading: leading ??
          IconButton(
            onPressed: onPressedLeading ?? () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              size: 20.sp,
              color: backbuttonColor ?? Colors.black,
            ),
            splashRadius: 20.sp,
          ),
      backgroundColor: backgroundColor,
      title: title == null
          ? (titleWidget ?? const SizedBox.shrink())
          : Text(
              title ?? '',
              style: textStyle ??
                  AppTextStyle.text18BlackW600.copyWith(
                    color: textColor ?? Colors.black,
                    fontSize: Dimens.fontSize18,
                  ),
            ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: Svg(AppImages.appBarBg),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
