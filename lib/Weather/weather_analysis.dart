import 'dart:developer';

import 'package:hackohio12/global_methods.dart';

class WeatherAnalysis {
  /// Create lists containing the weather data from the previous five days
  static List<num> pressures = Global.weatherData.getPastPressures();
  static List<num> temperatures = Global.weatherData.getPastTemperatures();
  static List<num> humidities = Global.weatherData.getPastHumidities();
  static List<num> windSpeeds = Global.weatherData.getPastWindSpeeds();
  static List<num> precipitations = Global.weatherData.getPastPrecipitations();

  /// Initialize the rest of the weather data by adding the upcoming five days' data
  static void initialize() {
    // Future Predictions
    pressures.addAll(Global.weatherData.getUpcomingPressures());
    temperatures.addAll(Global.weatherData.getUpcomingTemperatures());
    humidities.addAll(Global.weatherData.getUpcomingHumidities());
    windSpeeds.addAll(Global.weatherData.getUpcomingWindSpeeds());
    precipitations.addAll(Global.weatherData.getUpcomingPrecipitations());
  }

  /// Method to get the chance of having a migraine within the next five days
  static List<double> checkMigraineChances() {
    // Initialize an array to hold the probability of having a migraine
    List<double> migraineChances = List.empty(growable: true);
    // Initialize the contributions of the relevant weather factors
    double pressureChangeContribution = 0;
    double temperatureContribution = 0;
    double humidityContribution = 0;

    // For the upcoming five days
    for (int i = 0; i < 6; i++) {
      // Get the difference in pressure between the day and the previous day
      num pressureChange = pressures[5 + i] - pressures[4 + i];
      // Linearly interpolate the contribution of pressure changes on migraine risk
      // Pressure changes are mapped from between 0HPa and -6HPa to 0 and 1
      if (pressureChange < -6) {
        pressureChangeContribution = 1;
      } else if (pressureChange < 0) {
        pressureChangeContribution = 1 - (pressureChange + 6) / 6;
      }

      // Get the difference in temperature between the day and the previous day
      num temperatureChange = temperatures[5 + i] - temperatures[4 + i];
      // Linearly interpolate the contribution of temperature changes on migraine risk
      // Temperature changes are mapped from between 0f and 10F to 0 and 1
      if (temperatureChange > 10) {
        temperatureContribution = 1;
      } else if (temperatureChange > 0) {
        temperatureContribution = temperatureChange / 10;
      }

      // Get the difference in temperature between the day and the previous day
      num humidityChange = humidities[5 + i] - humidities[4 + i];
      // Linearly interpolate the contribution of humidity changes on migraine risk
      // Humidity changes are mapped from between 0% and 25% to 0 and 1
      if (humidityChange > 25) {
        humidityContribution = 1;
      } else if (humidityChange > 0) {
        humidityContribution = humidityChange / 25;
      }
      
      // Calculate the weighted average of weather factor contributions on migraine risk
      // Pressure change contributions is greater than humidity, which is greater than temperature
      migraineChances.add(100 * (0.65 * pressureChangeContribution +
          0.25 * humidityContribution + 
          0.1 * temperatureContribution));
    }

    return migraineChances;
  }

  /// Method to get the chance of having an asthma flare-up within the next five days
  static List<double> getAsthmaChances() {
    // Initialize an array to hold the probability of having an asthma flare-up
    List<double> asthmaChances = List.empty(growable: true);
    // Initialize the contributions of the relevant weather factors
    double temperatureContribution = 0;
    double humidityContribution = 0;
    double windSpeedContribution = 0;

    // For the upcoming five days
    for (int i = 0; i < 6; i++) {
      // Linearly interpolate the contribution of the temperature on asthma flare-up risk
      // Temperature is mapped from between 50F and 0F to 0 and 1
      if (temperatures[5 + i] < 0) {
        temperatureContribution = 1;
      }
      if (temperatures[5 + i] <= 50) {
        temperatureContribution = (50 - temperatures[5 + i]) / 50;
      }

      // Linearly interpolate the contribution of the humidity on asthma flare-up risk
      // Humidity is mapped from between 70% and 100% to 0 and 1 and from between 30% and 0% to 0 and 1 
      if (humidities[5 + i] > 1) {
        humidityContribution = 1;
      }
      if (humidities[5 + i] > 70) {
        humidityContribution = (humidities[5 + i] - 70) / 0.3;
      } else if (humidities[5 + i] < 30) {
        humidityContribution = (30 - humidities[5 + i]) / 0.3;
      }
      
      // Linearly interpolate the contribution of the wind speed on asthma flare-up risk
      // Wind speed is mapped from between 15 and 30 to 0 and 1
      if (windSpeeds[i+5]>30){
        windSpeedContribution = 1;
      } else if (windSpeeds[i+5] > 15) {
        windSpeedContribution = (windSpeeds[i+5] - 15)/15;
      }

      // Calculate the weighted average of weather factor contributions on asthma flare-up risk
      // Temperature and humidity contributions are greater than wind speed
      asthmaChances.add(100 * (0.45 * temperatureContribution +
          0.45 * humidityContribution) + 
          0.1 * windSpeedContribution);
    }

    return asthmaChances;
  }

  /// Method to get the chance of having an arthritis flare-up within the next five days
  static List<double> getArthritisChances() {
    // Initialize an array to hold the probability of having an arthritis flare-up
    List<double> arthritisChances = List.empty(growable: true);
    // Initialize the contributions of the relevant weather factors
    double pressureChangeContribution = 0;
    double temperatureContribution = 0;
    double humidityContribution = 0;
    double windSpeedContribution = 0;

    // For the upcoming five days
    for (int i = 0; i < 6; i++) {
      // Get the difference in temperature between the day and the previous day
      num pressureChange = pressures[5 + i] - pressures[4 + i];
      // Linearly interpolate the contribution of pressure changes on arthritis flare-up risk
      // Pressure changes are mapped with absolute values from between 0HPa and 6HPa to 0 and 1
      if (pressureChange < -6) {
        pressureChangeContribution = 1;
      } else if (pressureChange < 0) {
        pressureChangeContribution = 1 - (pressureChange + 6) / 6;
      } else if (pressureChange < 6) {
        pressureChangeContribution = (pressureChange + 6) / 6;
      }else if (pressureChange > 6) {
        pressureChangeContribution = 1;
      }

      // Linearly interpolate the contribution of the temperature on arthritis flare-up risk
      // Temperature is mapped from between 40F and 0F to 0 and 1
      if (temperatures[5 + i] < 0) {
        temperatureContribution = 1;
      }
      if (temperatures[5 + i] < 40) {
        temperatureContribution = (40 - temperatures[5 + i]) / 40;
      }

      // Linearly interpolate the contribution of the humidity on arthritis flare-up risk
      // Humidity is mapped from between 70% and 100% to 0 and 1
      if (humidities[5 + i] > 1) {
        humidityContribution = 1;
      }
      if (humidities[5 + i] > 70) {
        humidityContribution = (humidities[5 + i] - 70) / 30;
      }

      // Linearly interpolate the contribution of the wind speed on arthritis flare-up risk
      // Wind speed is mapped from between 15 and 30 to 0 and 1
      if (windSpeeds[i+5]>30){
        windSpeedContribution = 1;
      } else if (windSpeeds[i+5] > 15) {
        windSpeedContribution = (windSpeeds[i+5] - 15)/15;
      }

      // Calculate the weighted average of weather factor contributions on arthritis flare-up risk
      // Pressure change contributions is greater than temperature, which is greater than humidity, 
      // which is greater than wind speed
      arthritisChances.add(100 * (0.45 * pressureChangeContribution +
          0.25 * temperatureContribution +
          0.2 * humidityContribution + 
          0.1 * windSpeedContribution));
    }

    return arthritisChances;
  }
}
