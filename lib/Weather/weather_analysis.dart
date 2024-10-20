import 'dart:developer';

import 'package:hackohio12/global_methods.dart';

class WeatherAnalysis {
  static List<num> pressures = Global.weatherData.getPastPressures();
  static List<num> temperatures = Global.weatherData.getPastTemperatures();
  static List<num> humidities = Global.weatherData.getPastHumidities();
  static List<num> windSpeeds = Global.weatherData.getPastWindSpeeds();
  static List<num> precipitations = Global.weatherData.getPastPrecipitations();

  static void initialize() {
    // Future Predictions
    pressures.addAll(Global.weatherData.getUpcomingPressures());
    temperatures.addAll(Global.weatherData.getUpcomingTemperatures());
    humidities.addAll(Global.weatherData.getUpcomingHumidities());
    windSpeeds.addAll(Global.weatherData.getUpcomingWindSpeeds());
    precipitations.addAll(Global.weatherData.getUpcomingPrecipitations());
  }

  static List<double> checkMigraineChances() {
    List<double> migraineChances = List.empty(growable: true);
    double pressureChangeContribution = 0;
    double temperatureContribution = 0;
    double humidityContribution = 0;

    for (int i = 0; i < 6; i++) {
      num pressureChange = pressures[5 + i] - pressures[4 + i];
      if (pressureChange < -6) {
        pressureChangeContribution = 1;
      } else if (pressureChange < 0) {
        pressureChangeContribution = 1 - (pressureChange + 6) / 6;
      }

      num temperatureChange = temperatures[5 + i] - temperatures[4 + i];
      if (temperatureChange > 10) {
        temperatureContribution = 1;
      } else if (temperatureChange > 0) {
        temperatureContribution = temperatureChange / 10;
      }

      num humidityChange = humidities[5 + i] - humidities[4 + i];
      if (humidityChange > 25) {
        humidityContribution = 1;
      } else if (humidityChange > 0) {
        humidityContribution = humidityChange / 25;
      }

      migraineChances.add(100 * (0.65 * pressureChangeContribution +
          0.1 * temperatureContribution +
          0.25 * humidityContribution));
    }

    return migraineChances;
  }

  static List<double> getAsthmaChances() {
    List<double> asthmaChances = List.empty(growable: true);
    double temperatureContribution = 0;
    double humidityContribution = 0;
    double windSpeedContribution = 0;

    for (int i = 0; i < 6; i++) {
      if (temperatures[5 + i] < 0) {
        temperatureContribution = 1;
      }
      if (temperatures[5 + i] <= 50) {
        temperatureContribution = (50 - temperatures[5 + i]) / 50;
      }

      if (humidities[5 + i] > 1) {
        humidityContribution = 1;
      }
      if (humidities[5 + i] > 70) {
        humidityContribution = (humidities[5 + i] - 70) / 0.3;
      } else if (humidities[5 + i] < 30) {
        humidityContribution = (30 - humidities[5 + i]) / 0.3;
      }
      
      if (windSpeeds[i+5]>30){
        windSpeedContribution = 1;
      } else if (windSpeeds[i+5] > 15) {
        windSpeedContribution = (windSpeeds[i+5] - 15)/15;
      }

      asthmaChances.add(100 * (0.5 * temperatureContribution +
          0.5 * humidityContribution) + 
          0.1 * windSpeedContribution);
    }

    return asthmaChances;
  }

  static List<double> getArthritisChances() {
    List<double> arthritisChances = List.empty(growable: true);
    double pressureChangeContribution = 0;
    double temperatureContribution = 0;
    double humidityContribution = 0;
    double windSpeedContribution = 0;

    for (int i = 0; i < 6; i++) {
      num pressureChange = pressures[5 + i] - pressures[4 + i];
      if (pressureChange < -6) {
        pressureChangeContribution = 1;
      } else if (pressureChange < 0) {
        pressureChangeContribution = 1 - (pressureChange + 6) / 6;
      } else if (pressureChange < 6) {
        pressureChangeContribution = (pressureChange + 6) / 6;
      }else if (pressureChange > 6) {
        pressureChangeContribution = 1;
      }

      if (temperatures[5 + i] < 0) {
        temperatureContribution = 1;
      }
      if (temperatures[5 + i] < 40) {
        temperatureContribution = (40 - temperatures[5 + i]) / 40;
      }

      if (humidities[5 + i] > 1) {
        humidityContribution = 1;
      }
      if (humidities[5 + i] > 70) {
        humidityContribution = (humidities[5 + i] - 70) / 30;
      }

      if (windSpeeds[i+5]>30){
        windSpeedContribution = 1;
      } else if (windSpeeds[i+5] > 15) {
        windSpeedContribution = (windSpeeds[i+5] - 15)/15;
      }

      arthritisChances.add(100 * (0.45 * pressureChangeContribution +
          0.25 * temperatureContribution +
          0.2 * humidityContribution + 
          0.1 * windSpeedContribution));
    }

    return arthritisChances;
  }
}
