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

  static LinearGradient gradient(){
    return LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
  }
  static Color background() {
    return Color.fromARGB(255, 230, 222, 235);
  }

  static Color appBar() {
    return Color.fromARGB(255, 255, 255, 255);
  }

  static Color foreground() {
    return Color.fromARGB(255, 255, 255, 255);
  }

  static Color textColor() {
    return Color.fromARGB(255, 255, 255, 255);
  }
}
