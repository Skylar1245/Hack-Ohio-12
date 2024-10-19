import 'package:weather/weather.dart';

///Specialized implementation of https://pub.dev/packages/weather
///leveraging https://pub.dev/packages/geolocator for location services
class Weather {
  WeatherFactory weatherFactory;

  ///OpenWeatherMap API key obtained for free at
  ///https://openweathermap.org/price
  static final String _apiKey = "6bc5a74652a7e36c118775e11f341534";

  Weather() : weatherFactory = WeatherFactory(_apiKey);
}
