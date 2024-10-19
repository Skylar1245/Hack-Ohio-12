import 'package:flutter/material.dart';
import 'package:hackohio12/Weather/weather_data.dart';

enum MedicalCondition {
  migraine(1),
  asthma(2),
  arthritis(3);

  const MedicalCondition(this.value);
  final int value;

  static MedicalCondition fromValue(int value) {
    return MedicalCondition.values.firstWhere((e) => e.value == value);
  }
}

class Global {
  ///WeatherData to reference anywhere needed
  static WeatherData weatherData = WeatherData();

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

  static LinearGradient gradient() {
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

  static Divider divider(context) {
    return Divider(
        height: getHeightByPercentage(context, 4), color: Colors.transparent);
  }

  static int percent(int medicalCond) {
    switch (medicalCond) {
      case 1:
        return 10;
      case 2:
        return 20;
      case 3:
        return 30;
      default:
        return 0;
    }
  }

  static String description(int medicalCond) {
    switch (medicalCond) {
      case 1:
        return "info about migraines";
      case 2:
        return "info about asthma";
      case 3:
        return "info about arthritis";
      default:
        return ":(";
    }
  }
}
