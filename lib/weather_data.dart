import 'package:hackohio12/permissions.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';

///Specialized implementation of https://pub.dev/packages/weather
///leveraging https://pub.dev/packages/geolocator for location services
class WeatherData {
  //Private [WeatherFactory] to read from
  final WeatherFactory _weatherFactory;

  ///User Latitude
  late double _userLatitude;
  //User Longitude
  late double _userLongitude;

  ///Todays weather
  late Weather weather;

  ///Weather forecast of 5 days
  late List<Weather> _forecast;

  ///OpenWeatherMap API key obtained for free at
  ///https://openweathermap.org/price
  static final String _apiKey = "6bc5a74652a7e36c118775e11f341534";

  ///Updates this class's user location members
  void _getUserPosition() async {
    await Permissions.requestLocationPermission();
    GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
    Position position = await geolocatorPlatform.getCurrentPosition();
    _userLatitude = position.latitude;
    _userLongitude = position.longitude;
    _forecast = await _weatherFactory.fiveDayForecastByLocation(
        _userLatitude, _userLongitude);
  }

  ///Updates this class's [weather] member
  void _populateWeatherByLocation() async {
    weather = await _weatherFactory.currentWeatherByLocation(
        _userLatitude, _userLongitude);
  }

  ///Constructor
  WeatherInterpreter() : _weatherFactory = WeatherFactory(_apiKey) {
    _getUserPosition();
    _populateWeatherByLocation();
  }

  ///Returns the current pressure at time of call
  double? getPressure() {
    return weather.pressure;
  }

  ///Returns the current humidity at time of call
  double? getHumidity() {
    return weather.humidity;
  }

  ///Returns the current temperature at time of call
  Temperature? getTemperature() {
    return weather.temperature;
  }

  ///Returns the upcoming 5 days of nullable pressures
  List<double?> getFiveDayPressure() {
    List<double?> pressures = List.empty();
    for (Weather w in _forecast) {
      pressures.add(w.pressure);
    }
    return pressures;
  }

  ///Returns the upcoming 5 days of nullable humidities
  List<double?> getFiveDayHumidity() {
    List<double?> humidities = List.empty();
    for (Weather w in _forecast) {
      humidities.add(w.humidity);
    }
    return humidities;
  }

  ///Returns the upcoming 5 days of nullable temperatures
  List<double?> getFiveDayTemperature() {
    List<double?> humidities = List.empty();
    for (Weather w in _forecast) {
      humidities.add(w.humidity);
    }
    return humidities;
  }
}
