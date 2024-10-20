import 'package:flutter/material.dart';
import 'package:hackohio12/Weather/weather_analysis.dart';
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

  static Color tableData() {
    return Color.fromARGB(100, 255, 255, 255);
  }

  static Color tableHeader() {
    return Color.fromARGB(150, 255, 255, 255);
  }

  static Divider divider(context) {
    return Divider(
        height: getHeightByPercentage(context, 4), color: Colors.transparent);
  }

  static String userLocation() {
    return "Implement this location";
  }

  static int percent(MedicalCondition medicalCond) {
    switch (medicalCond) {
      case MedicalCondition.migraine:
        List<double> migraineList = WeatherAnalysis.checkMigraineChances();
        return migraineList[0].toInt();
      case MedicalCondition.asthma:
        return 20;
      case MedicalCondition.arthritis:
        return 30;
      default:
        return 0;
    }
  }

  static String evalMigraine() {
    int x = percent(MedicalCondition.migraine);

    if (x < 25) {
      return "There is a low risk for migraines today based on weather patterns. However, migraines can be caused by all sorts of factors. To best prevent a migraine, be sure to get an appropriate amount of rest, stay hydrated, and limit screen time.";
    } else if (x >= 25 && x < 75) {
      return "There is a medium risk for migraines today based on weather patterns. Make sure to stay hydrated and carry any helpful pain-relievers with you, including medications, cold compresses, or essential oils.";
    } else {
      return "There is a high risk for migraines today based on weather patterns. In the event of a migraine, be sure to take any prescribed medications in a timely manner. In addition, a dark environment, cold compress, and some essential oils can help to relieve pain.";
    }
  }

  static String description(MedicalCondition medicalCond) {
    switch (medicalCond) {
      case MedicalCondition.migraine:
        return evalMigraine();
      case MedicalCondition.asthma:
        return "info about asthma";
      case MedicalCondition.arthritis:
        return "info about arthritis";
      default:
        return ":(";
    }
  }
}
