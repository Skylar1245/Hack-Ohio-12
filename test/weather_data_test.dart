import 'package:hackohio12/Weather/weather_data.dart';
import 'package:test/test.dart';

void main() {
  group('Test past weather methods', () {
    WeatherData weatherData = WeatherData();
    test('Past Pressure', () {
      List<double?> pressure = weatherData.getPastFiveDayPressure();
      expect(pressure.length, 5);
    });

    test('Past Humidities', () {
      List<double?> humidities = weatherData.getPastFiveDayHumidity();
      expect(humidities.length, 5);
    });

    test('Past Precipitation', () {
      List<double?> precipitation = weatherData.getPastFiveDayPrecipitation();
      expect(precipitation.length, 5);
    });
  });
}
