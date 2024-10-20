import 'dart:developer';

import 'package:hackohio12/global_methods.dart';

class WeatherAnalysis {
  //Past data
  static List<double> pressures = Global.weatherData.getPastPressures();
  static List<double> temperatures = Global.weatherData.getPastTemperatures();
  static List<double> humidities = Global.weatherData.getPastHumidities();
  static List<double> windSpeeds = Global.weatherData.getPastWindSpeeds();
  static List<double> precipitations = Global.weatherData.getPastPrecipitations();

  static void initialize(){
    pressures.addAll(Global.weatherData.getUpcomingPressures());
    temperatures.addAll(Global.weatherData.getUpcomingTemperatures());
    humidities.addAll(Global.weatherData.getUpcomingHumidities());
    windSpeeds.addAll(Global.weatherData.getUpcomingWindSpeeds());
    precipitations.addAll(Global.weatherData.getUpcomingPrecipitations());

    // Future Data
    pressures.addAll(Global.weatherData.getUpcomingPressures());
    temperatures.addAll(Global.weatherData.getUpcomingTemperatures());
    humidities.addAll(Global.weatherData.getUpcomingHumidities());
    windSpeeds.addAll(Global.weatherData.getUpcomingWindSpeeds());
    precipitations.addAll(Global.weatherData.getUpcomingPrecipitations());
  }
  
  static List<double> checkMigraineChances() {
    List<double> migraineChances = List.empty(growable: true);
    List<double> pressureChangeContributions = List.empty(growable: true);
    List<double> temperatureContributions = List.empty(growable: true);
    List<double> humidityContributions = List.empty(growable: true);
    
    for (int i = 0; i < 6; i++) {
      //More than 5HPa pressure drop
      log("Pressure Day ${5+i} ${pressures[5+i]} and Day ${4+i} ${pressures[4+i]}", name: "WeatherAnalysis");
      double pressureChange = pressures[5 + i] - pressures[4 + i];
      if (pressureChange < -5) {
        pressureChangeContributions.add(1);
      } else if (pressureChange < 0) {
        pressureChangeContributions.add(1 - (pressureChange + 5) / 5);
      } else {
        pressureChangeContributions.add(0);
      }
      log("Pressure contribution ${pressureChangeContributions[i]}", name: "WeatherAnalysis");
      

      log("Temperature Day ${5+i} ${temperatures[5+i]} and Day ${4+i} ${temperatures[4+i]}", name: "WeatherAnalysis");
      double temperatureChange = temperatures[5 + i] - temperatures[4 + i];
      if (temperatureChange > 10) {
        temperatureContributions.add(1);
      } else if (temperatureChange > 0) {
        temperatureContributions.add(temperatureChange / 10);
      } else {
        temperatureContributions.add(0);
      }
      log("Temperature contribution ${temperatureContributions[i]}", name: "WeatherAnalysis");

      log("Humidity Day ${5+i} ${humidities[5+i]} and Day ${4+i} ${humidities[4+i]}", name: "WeatherAnalysis");
      double humidityChange = humidities[5 + i] - humidities[4 + i];
      if (humidityChange > 0.25) {
        humidityContributions.add(1);
      } else if (humidityChange > 0) {
        humidityContributions.add(humidityChange / 0.25);
      } else {
        humidityContributions.add(0);
      }
      log("Humidity contribution ${humidityContributions[i]}", name: "WeatherAnalysis");

      migraineChances.add(100 * 0.65 * pressureChangeContributions[i] +
          0.1 * temperatureContributions[i] +
          0.25 * humidityContributions[i]);
      log("migraine chance: ${migraineChances[i]}", name: "WeatherAnalysis");
    }

    return migraineChances;
  }

  static List<double> getAsthmaChances() {
    List<double> asthmaChances = List.empty(growable: true);
    List<double> temperatureContributions = List.empty(growable: true);
    List<double> humidityContributions = List.empty(growable: true);

    for (int i = 0; i < 6; i++) {
      log("Temperature Day ${5+i} ${temperatures[5+i]} and Day ${4+i} ${temperatures[4+i]}", name: "WeatherAnalysis");
      if (temperatures[5+i] < 0) {
        temperatureContributions.add(1);
      } if (temperatures[5+i] < 50) {
        temperatureContributions.add( (50-temperatures[5+i])/50 );
      } else {
        temperatureContributions.add(0);
      }
      log("Temperature contribution ${temperatureContributions[i]}", name: "WeatherAnalysis");

      log("Humidity Day ${5+i} ${humidities[5+i]} and Day ${4+i} ${humidities[4+i]}", name: "WeatherAnalysis");
      if (humidities[5+i] > 1) {
        humidityContributions.add(1);
      } if (humidities[5+i] > 0.7) {
        humidityContributions.add( (humidities[5+i]-0.7)/0.3 );
      } else if (humidities[5+i] < 0.3) {
        humidityContributions.add( (0.3 - humidities[5+i]) / 0.3);
      } else {
        humidityContributions.add(0);
      }
      log("Humidity contribution ${humidityContributions[i]}", name: "WeatherAnalysis");

      asthmaChances.add(100 * 0.5 * temperatureContributions[i] +
          0.5 * humidityContributions[i]);
      log("migraine chance: ${asthmaChances[i]}", name: "WeatherAnalysis");
    }

    return asthmaChances;
  }

  static List<double> getArthritisChances() {
    List<double> arthritisChances = List.empty(growable: true);
    List<double> pressureChangeContributions = List.empty(growable: true);
    List<double> temperatureContributions = List.empty(growable: true);
    List<double> humidityContributions = List.empty(growable: true);
    
    for (int i = 0; i < 6; i++) {
      //More than 5HPa pressure drop
      log("Pressure Day ${5+i} ${pressures[5+i]} and Day ${4+i} ${pressures[4+i]}", name: "WeatherAnalysis");
      double pressureChange = pressures[5 + i] - pressures[4 + i];
      if (pressureChange < -6) {
        pressureChangeContributions.add(1);
      } else if (pressureChange < 0) {
        pressureChangeContributions.add(1 - (pressureChange + 5) / 5);
      } else {
        pressureChangeContributions.add(0);
      }
      log("Pressure contribution ${pressureChangeContributions[i]}", name: "WeatherAnalysis");
      

      log("Temperature Day ${5+i} ${temperatures[5+i]} and Day ${4+i} ${temperatures[4+i]}", name: "WeatherAnalysis");
      double temperatureChange = temperatures[5 + i] - temperatures[4 + i];
      if (temperatureChange > 10) {
        temperatureContributions.add(1);
      } else if (temperatureChange > 0) {
        temperatureContributions.add(temperatureChange / 10);
      } else {
        temperatureContributions.add(0);
      }
      log("Temperature contribution ${temperatureContributions[i]}", name: "WeatherAnalysis");

      log("Humidity Day ${5+i} ${humidities[5+i]} and Day ${4+i} ${humidities[4+i]}", name: "WeatherAnalysis");
      double humidityChange = humidities[5 + i] - humidities[4 + i];
      if (humidityChange > 0.25) {
        humidityContributions.add(1);
      } else if (humidityChange > 0) {
        humidityContributions.add(humidityChange / 0.25);
      } else {
        humidityContributions.add(0);
      }
      log("Humidity contribution ${humidityContributions[i]}", name: "WeatherAnalysis");

      arthritisChances.add(100 * 0.65 * pressureChangeContributions[i] +
          0.1 * temperatureContributions[i] +
          0.25 * humidityContributions[i]);
      log("migraine chance: ${arthritisChances[i]}", name: "WeatherAnalysis");
    }

    return arthritisChances;
  }
}
