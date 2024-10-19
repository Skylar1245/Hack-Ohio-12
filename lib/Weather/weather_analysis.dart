import 'package:hackohio12/Weather/weather_data.dart';
import 'package:weather/weather.dart';

class WeatherAnalysis {

  WeatherData weatherData = WeatherData();

  double checkMigraine() {

    List<double?> pastFiveDayPressureData = weatherData.getPastFiveDayPressure();
    //List<double> pastFiveDayTemperature = weatherData.getPastFiveDayTemperature();
    //List<double> pastFiveDayHumidity = weatherData.getPastFiveDayHumidity();
    //List<double> pastFiveDayWind = weatherData.getPastFiveDayTemperature();
    //List<double> pastFiveDayPrecipitation = weatherData.getPastFiveDayTemperature();
    double todayPressure = weatherData.getTodaysPressure()!;
    double todayHumidity = weatherData.getTodaysHumidity()!;
    double todayWind = weatherData.getTodaysHumidity()!;
    double todayPrecipitation = weatherData.getTodaysHumidity()!;
    Temperature todayTemperature = weatherData.getTodaysTemperature()!;

    // More than 500Pa pressure drop
    //double? pressureChange = pastFiveDayPressureData[1] - pastFiveDayPressureData[0];

    double temperatureChange = 0;

    double migraineChance = 0;
    
    //List<double> prevSevenDays = List.empty();
    
    /*for (int i =  0; i < fiveDayPressure.length; i++ ) {

    }

    double flarePressureChange = -500.0; // pascal

    double migraineChance = 1 - ((prevSevenDays[1] - prevSevenDays[0]) - flarePressureChange) / flarePressureChange;

    //double migraineChance = 0.0;

    if ( ( prevSevenDays[1] - prevSevenDays[0] ) > flarePressureChange){
        migraineChance = 1.0;
    }
    */
    return migraineChance;
  }

}
