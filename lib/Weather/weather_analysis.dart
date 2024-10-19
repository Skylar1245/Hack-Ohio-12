import 'package:hackohio12/Weather/weather_data.dart';
import 'package:weather/weather.dart';

class WeatherAnalysis {
  WeatherData weatherData = WeatherData();

  double checkMigraine() {
    //Past data
    List<double> pastFiveDayPressureData = weatherData.getPastPressures();
    List<double> pastFiveDayTemperature = weatherData.getPastTemperatures();
    List<double> pastFiveDayHumidity = weatherData.getPastHumidities();
    List<double> pastFiveDayWind = weatherData.getPastWindSpeeds();
    List<double> pastFiveDayPrecipitation = weatherData.getPastPrecipitations();
    //Today Data
    double todayPressure = weatherData.getTodaysPressure();
    double todayHumidity = weatherData.getTodaysHumidity();
    double todayWind = weatherData.getTodaysWind();
    double todayPrecipitation = weatherData.getTodaysPrecipitation();
    Temperature todayTemperature = weatherData.getTodaysTemperature();

    //More than 500Pa pressure drop
    /*
    double? pressureChange =
        pastFiveDayPressureData[1] - pastFiveDayPressureData[0];
    */
    double temperatureChange = 0;

    double migraineChance = 0;

    List<double> prevSevenDays = List.empty(growable: true);

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
