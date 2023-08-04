import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImages {
  ///add app images here
  const AppImages._();

  static SizedBox svg(String name,
      {double? width,
      double? height,
      Widget Function(BuildContext context)? placeholderBuilder,
      String defaultImage = "",
      BoxFit fit = BoxFit.contain,
      Color? color}) {
    return SizedBox(
      width: width ?? 24.w,
      height: height ?? 24.h,
      child: SvgPicture.asset(
        name,
        fit: fit,
        allowDrawingOutsideViewBox: true,
        colorFilter:
            color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      ),
    );
  }

  /* static Widget svgUrl(String name,
      {Color? color,
      double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      bool circle = false,
      Widget? placeholderWidget,
      Map<String, String>? header,
      EdgeInsets padding = const EdgeInsets.all(6.0)}) {
    return Padding(
      padding: padding,
      child: SvgPicture.network(
        name,
        color: color,
        placeholderBuilder: (context) => placeholderWidget ?? Container(),
        width: width,
        height: height,
        fit: fit,
        headers: header,
      ),
    );
  } */

  /* static Widget imgNetWorking(
    String url, {
    BorderRadiusGeometry? borderRadius,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
  }) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: url,
        memCacheHeight: toInt(height),
        memCacheWidth: toInt(width),
        progressIndicatorBuilder: (context, text, value) {
          return Center(
            child: ProcessLine(
                color: AppColors.primaryPurpleColor,
                backgroundColor: AppColors.primaryPurpleColor.withOpacity(0.4),
                percent: value.progress ?? 0),
          );
        },
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          size: 22.sp,
          color: Colors.white,
        ),
      ),
    );
  } */

  //home
  static const String homeBg = 'assets/images/home_bg.svg';

  static const String icHamburger = 'assets/icons/hamburger.svg';
  static const String icHistoric = 'assets/icons/historic.svg';
  static const String icSend = 'assets/icons/send.svg';

  //chat
  static const String appBarBg = 'assets/images/app_bar_bg.svg';

  //history
  static const String icDeleteFilled = 'assets/icons/delete_filled.svg';
  static const String icShare = 'assets/icons/share.svg';

  //settings
  static const String settingsHeader = 'assets/images/settings_header.svg';
  static const String chevRight = 'assets/icons/chevron_right.svg';
  static const String icConversation = 'assets/icons/conversation.svg';
  static const String icRestore = 'assets/icons/restore.svg';
  static const String icStar = 'assets/icons/star.svg';
  static const String icTermsOfUse = 'assets/icons/terms_of_use.svg';
  static const String icPersonWithShield =
      'assets/icons/person_with_shield.svg';
  static const String icShareSettings = 'assets/icons/share_settings.svg';
}
