import 'package:hackohio12/Weather/weather_data.dart';
import 'package:hackohio12/global_methods.dart';
import 'package:weather/weather.dart';

class WeatherAnalysis {
  static List<double> checkMigraineChances() {
    /*
    //Past data
    List<double> pastFiveDayPressureData = Global.weatherData.getPastPressures();
    List<double> pastFiveDayTemperature = Global.weatherData.getPastTemperatures();
    List<double> pastFiveDayHumidity = Global.weatherData.getPastHumidities();
    List<double> pastFiveDayWindSpeed = Global.weatherData.getPastWindSpeeds();
    List<double> pastFiveDayPrecipitation = Global.weatherData.getPastPrecipitations();
    //Today Data
    double todayPressure = Global.weatherData.getTodaysPressure();
    double todayHumidity = Global.weatherData.getTodaysHumidity();
    double todayWindSpeed = Global.weatherData.getTodaysWind();
    double todayPrecipitation = Global.weatherData.getTodaysPrecipitation();
    Temperature todayTemperature = Global.weatherData.getTodaysTemperature();
    // Future Predictions
    List<double> futureFiveDayPressureData = Global.weatherData.getUpcomingPressures();
    List<double> futureFiveDayTemperature = Global.weatherData.getUpcomingTemperatures();
    List<double> futureFiveDayHumidity = Global.weatherData.getUpcomingHumidities();
    List<double> futureFiveDayWindSpeed = Global.weatherData.getUpcomingWindSpeeds();
    List<double> futureFiveDayPrecipitation = Global.weatherData.getUpcomingPrecipitations();
    */

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

    List<double> migraineChances = List.empty();
    List<double> pressureChangeContributions = List.empty();
    List<double> temperatureContributions = List.empty();
    List<double> humidityContributions = List.empty();
    //More than 500Pa pressure drop
    for (int i = 0; i < 6; i++){
      double pressureChange = pressures[5+i] - pressures[4+i];
      if (pressureChange < -500){
        pressureChangeContributions.add(1);
      }
      else if (pressureChange < 0) {
        pressureChangeContributions.add(1 - (pressureChange + 500) / 500);
      }
      else{
        pressureChangeContributions.add(0);
      }

      double temperatureChange = temperatures[5+i] - temperatures[4+i];
      if (temperatureChange > 10){
        temperatureContributions.add(1);
      }
      else if (temperatureChange > 0){
        temperatureContributions.add(temperatureChange/10);
      }
      else{
        temperatureContributions.add(0);
      }
      
      double humidityChange = humidities[5+i]/humidities[4+i];
      if (humidityChange > 1.25){
        humidityContributions.add(1);
      }
      else if (humidityChange > 1){
        humidityContributions.add((humidityChange-1)/0.25);
      }
      else{
        humidityContributions.add(0);
      }

      migraineChances.add(0.62*pressureChangeContributions[i] + 0.1*temperatureContributions[i] + 0.28*humidityContributions[i]);
    }

    /*
    //More than 500Pa pressure drop
    double pressureChange = todayPressure - pastFiveDayPressureData[0];
    double pressureChangeContribution = 0;
    if (pressureChange < -500){
      pressureChangeContribution = 1;
    }
    else if (pressureChange < 0) {
      pressureChangeContribution = 1 - (pressureChange + 500) / 500;
    }

    double temperatureContribution = 0;
    double temperatureChange = todayTemperature.kelvin! - pastFiveDayTemperature[0];
    if (temperatureChange > 10){
      temperatureContribution = 1;
    }
    else if (temperatureChange > 0){
      temperatureContribution = temperatureChange/10;
    }
    
    double humidityContribution = 0;
    double humidityChange = todayHumidity/pastFiveDayHumidity[0];
    if (humidityChange > 1.25){
      humidityContribution = 1;
    }
    else if (humidityChange > 1){
      humidityContribution = (humidityChange-1)/0.25;
    }
    double migraineChance = 0.62*pressureChangeContribution + 0.1*temperatureContribution + 0.28*humidityContribution;
    */
    return migraineChances;
  }
}
