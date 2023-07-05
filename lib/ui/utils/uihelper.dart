import 'package:flutter/material.dart';

class UiHelper {
  static Widget verticalSpacing(double value) {
    return SizedBox(
      height: value,
    );
  }

  static Widget horizontalSpacing(double value) {
    return SizedBox(
      width: value,
    );
  }

  static Widget horizontalDivider(
      {required Color color,
      required double thickness,
      required int endIndent}) {
    return Divider(
      color: color,
      thickness: thickness,
      height: 3,
    );
  }
}
