import 'package:hackohio12/Weather/weather_data.dart';

class WeatherAnalysis {

  WeatherData weatherData = WeatherData();

  double CheckMigraine() {

    List<double?> fiveDayPressureData = weatherData.getFiveDayPressure();

    List<double> prevSevenDays = List.empty();
    
    /*for (int i =  0; i < fiveDayPressure.length; i++ ) {

    }*/

    double flarePressureChange = -500.0; // pascal

    double migraineChance = 1 - ((prevSevenDays[1] - prevSevenDays[0]) - flarePressureChange) / flarePressureChange;

    //double migraineChance = 0.0;

    if ( ( prevSevenDays[1] - prevSevenDays[0] ) > flarePressureChange){
        migraineChance = 1.0;
    }

    return migraineChance;
  }

}
