import 'package:hackohio12/Weather/weather_data.dart';
import 'package:weather/weather.dart';

class WeatherAnalysis {
  WeatherData weatherData = WeatherData();

  List<double> checkMigraineToday() {
    /*
    //Past data
    List<double> pastFiveDayPressureData = weatherData.getPastPressures();
    List<double> pastFiveDayTemperature = weatherData.getPastTemperatures();
    List<double> pastFiveDayHumidity = weatherData.getPastHumidities();
    List<double> pastFiveDayWindSpeed = weatherData.getPastWindSpeeds();
    List<double> pastFiveDayPrecipitation = weatherData.getPastPrecipitations();
    //Today Data
    double todayPressure = weatherData.getTodaysPressure();
    double todayHumidity = weatherData.getTodaysHumidity();
    double todayWindSpeed = weatherData.getTodaysWind();
    double todayPrecipitation = weatherData.getTodaysPrecipitation();
    Temperature todayTemperature = weatherData.getTodaysTemperature();
    // Future Predictions
    List<double> futureFiveDayPressureData = weatherData.getUpcomingPressures();
    List<double> futureFiveDayTemperature = weatherData.getUpcomingTemperatures();
    List<double> futureFiveDayHumidity = weatherData.getUpcomingHumidities();
    List<double> futureFiveDayWindSpeed = weatherData.getUpcomingWindSpeeds();
    List<double> futureFiveDayPrecipitation = weatherData.getUpcomingPrecipitations();
    */

    //Past data
    List<double> pressures = weatherData.getPastPressures();
    List<double> temperatures = weatherData.getPastTemperatures();
    List<double> humidities = weatherData.getPastHumidities();
    List<double> windSpeeds = weatherData.getPastWindSpeeds();
    List<double> precipitations = weatherData.getPastPrecipitations();
    //Today Data
    pressures.add(weatherData.getTodaysPressure());
    temperatures.add(weatherData.getTodaysTemperature().kelvin!);
    humidities.add(weatherData.getTodaysHumidity());
    windSpeeds.add(weatherData.getTodaysWind());
    precipitations.add(weatherData.getTodaysPrecipitation());
    // Future Predictions
    pressures.addAll(weatherData.getUpcomingPressures());
    temperatures.addAll(weatherData.getUpcomingTemperatures());
    humidities.addAll(weatherData.getUpcomingHumidities());
    windSpeeds.addAll(weatherData.getUpcomingWindSpeeds());
    precipitations.addAll(weatherData.getUpcomingPrecipitations());

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
