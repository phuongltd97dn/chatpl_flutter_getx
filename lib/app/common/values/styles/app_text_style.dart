import 'package:flutter/material.dart';

import 'dimens.dart';

class AppTextStyle {
  const AppTextStyle._();

  static const TextStyle _textStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _textStyleBold = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle semiBoldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle text10BlackW400 = _textStyle.copyWith(
    fontSize: Dimens.fontSize10,
  );

  static final TextStyle text12BlackW400 = _textStyle.copyWith(
    fontSize: Dimens.fontSize12,
  );

  static final TextStyle text14BlackW400 = _textStyle.copyWith(
    fontSize: Dimens.fontSize14,
  );

  static final TextStyle text15BlackW400 = _textStyle.copyWith(
    fontSize: Dimens.fontSize15,
  );

  static final TextStyle text16BlackW400 = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
  );

  static final TextStyle text18BlackW400 = _textStyle.copyWith(
    fontSize: Dimens.fontSize18,
  );

  static final TextStyle text28BlackW400 = _textStyle.copyWith(
    fontSize: Dimens.fontSize28,
  );

  static final TextStyle text18BlackW600 = _textStyleBold.copyWith(
    fontSize: Dimens.fontSize18,
  );

  static final TextStyle text34BlackW600 = _textStyleBold.copyWith(
    fontSize: Dimens.fontSize34,
  );
}
