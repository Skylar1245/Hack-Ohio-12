import 'package:flutter/material.dart';

class Global {
  ///Returns a scaled widget width based on a percentage of the screen width
  static double getWidthByPercentage(BuildContext context, int percentage) {
    double percentModifier = percentage / 100;
    return MediaQuery.sizeOf(context).width * percentModifier;
  }

  ///Returns a scaled widget height based on a percentage of the screen height
  static double getHeightByPercentage(BuildContext context, int percentage) {
    double percentModifier = percentage / 100;
    return MediaQuery.sizeOf(context).height * percentModifier;
  }
}
