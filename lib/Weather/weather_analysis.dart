import 'dart:developer';

import 'package:hackohio12/global_methods.dart';

class WeatherAnalysis {
  static List<double> checkMigraineChances() {
    //Past data
    List<double> pressures = Global.weatherData.getPastPressures();
    List<double> temperatures = Global.weatherData.getPastTemperatures();
    List<double> humidities = Global.weatherData.getPastHumidities();
    List<double> windSpeeds = Global.weatherData.getPastWindSpeeds();
    List<double> precipitations = Global.weatherData.getPastPrecipitations();
    //Today Data
    pressures.add(Global.weatherData.getTodaysPressure());
    temperatures.add(Global.weatherData.getTodaysTemperature().kelvin!);
    humidities.add(Global.weatherData.getTodaysHumidity());
    windSpeeds.add(Global.weatherData.getTodaysWind());
    precipitations.add(Global.weatherData.getTodaysPrecipitation());
    // Future Predictions
    pressures.addAll(Global.weatherData.getUpcomingPressures());
    temperatures.addAll(Global.weatherData.getUpcomingTemperatures());
    humidities.addAll(Global.weatherData.getUpcomingHumidities());
    windSpeeds.addAll(Global.weatherData.getUpcomingWindSpeeds());
    precipitations.addAll(Global.weatherData.getUpcomingPrecipitations());

    List<double> migraineChances = List.empty(growable: true);
    List<double> pressureChangeContributions = List.empty(growable: true);
    List<double> temperatureContributions = List.empty(growable: true);
    List<double> humidityContributions = List.empty(growable: true);
    //More than 500Pa pressure drop
    for (int i = 0; i < 6; i++) {
      log("message", name: "WeatherAnalysis");
      double pressureChange = pressures[5 + i] - pressures[4 + i];
      if (pressureChange < -500) {
        pressureChangeContributions.add(1);
      } else if (pressureChange < 0) {
        pressureChangeContributions.add(1 - (pressureChange + 500) / 500);
      } else {
        pressureChangeContributions.add(0);
      }

      double temperatureChange = temperatures[5 + i] - temperatures[4 + i];
      if (temperatureChange > 10) {
        temperatureContributions.add(1);
      } else if (temperatureChange > 0) {
        temperatureContributions.add(temperatureChange / 10);
      } else {
        temperatureContributions.add(0);
      }

      double humidityChange = humidities[5 + i] / humidities[4 + i];
      if (humidityChange > 1.25) {
        humidityContributions.add(1);
      } else if (humidityChange > 1) {
        humidityContributions.add((humidityChange - 1) / 0.25);
      } else {
        humidityContributions.add(0);
      }

      migraineChances.add(100*0.62 * pressureChangeContributions[i] +
          0.1 * temperatureContributions[i] +
          0.28 * humidityContributions[i]);
    }

    return migraineChances;
  }
}
