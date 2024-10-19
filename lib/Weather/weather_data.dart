import 'dart:convert';
import 'dart:developer';

import 'package:hackohio12/Weather/PreviousDay.dart';
import 'package:hackohio12/permissions.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

///Specialized implementation of https://pub.dev/packages/weather
///leveraging https://pub.dev/packages/geolocator for location services
class WeatherData {
  ///Private [WeatherFactory] to read from
  final WeatherFactory _weatherFactory;

  ///User Latitude
  double _userLatitude = 0;
  //User Longitude
  double _userLongitude = 0;

  ///Todays weather
  late Weather weather;

  ///Weather forecast of 5 days
  List<Weather> _futureForecast = List.empty(growable: true);

  ///
  List<PreviousDay> _pastDays = List.empty(growable: true);

  ///OpenWeatherMap API key obtained for free at
  ///https://openweathermap.org/price
  static final String _apiKey = "6bc5a74652a7e36c118775e11f341534";

  ///Updates this class's user location members
  Future<void> _populateFields() async {
    Permissions.requestLocationPermission();
    GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
    Position position = await geolocatorPlatform.getCurrentPosition();
    _userLatitude = position.latitude;
    _userLongitude = position.longitude;
    //populate future weather
    weather = await _weatherFactory.currentWeatherByLocation(
        _userLatitude, _userLongitude);
    _futureForecast = await _weatherFactory.fiveDayForecastByLocation(
        _userLatitude, _userLongitude);
    //populate past weather
    String url =
        "https://history.openweathermap.org/data/2.5/aggregated/year?lat=$_userLatitude&lon=$_userLongitude&appid=$_apiKey";

    final response = await http.get(Uri.parse(url));

    log(url, name: "WeatherData");

    if (response.statusCode == 200) {
      _pastDays = PreviousDay.fromJsonList(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception("OpenWeather did not reply");
    }
  }

  Future<bool> initialize() async {
    await _populateFields();
    return true;
  }

  ///Constructor
  WeatherData() : _weatherFactory = WeatherFactory(_apiKey);

  ///Returns the current pressure at time of call
  double? getTodaysPressure() {
    return weather.pressure;
  }

  ///Returns the current humidity at time of call
  double? getTodaysHumidity() {
    return weather.humidity;
  }

  ///Returns the current temperature at time of call
  Temperature? getTodaysTemperature() {
    return weather.temperature;
  }

  ///Returns the upcoming 5 days of nullable pressures
  List<double?> getFiveDayPressure() {
    List<double?> pressures = List.empty(growable: true);
    for (Weather w in _futureForecast) {
      pressures.add(w.pressure);
    }
    return pressures;
  }

  ///Returns the upcoming 5 days of nullable humidities
  List<double?> getFiveDayHumidity() {
    List<double?> humidities = List.empty(growable: true);
    for (Weather w in _futureForecast) {
      humidities.add(w.humidity);
    }
    return humidities;
  }

  ///Returns the upcoming 5 days of nullable temperatures
  List<double?> getFiveDayTemperature() {
    List<double?> humidities = List.empty(growable: true);
    for (Weather w in _futureForecast) {
      humidities.add(w.humidity);
    }
    return humidities;
  }

  bool _isPastFiveDays(PreviousDay day) {
    DateTime lowerBound = DateTime.now().subtract(const Duration(days: 5));
    DateTime upperBound = DateTime.now();
    DateTime dayDate = DateTime(DateTime.now().year, day.month, day.day);
    if (dayDate.isAfter(lowerBound) && dayDate.isBefore(upperBound)) {
      return true;
    } else {
      return false;
    }
  }

  ///Returns the previous 5 days of nullable pressures
  List<double?> getPastFiveDayPressure() {
    List<double?> pressures = List.empty(growable: true);
    Iterable<PreviousDay> days = _pastDays.where((day) => _isPastFiveDays(day));
    for (PreviousDay day in days) {
      pressures.add(day.pressure['mean']);
    }
    log("Found ${pressures.length} pressures in range", name: "WeatherData");
    return pressures;
  }

  ///Returns the previous 5 days of nullable humidity
  List<double?> getPastFiveDayHumidity() {
    List<double?> humidities = List.empty(growable: true);
    for (PreviousDay day in _pastDays.where((day) => _isPastFiveDays(day))) {
      humidities.add(day.humidity['mean']);
    }
    log("Found ${humidities.length} humidities in range", name: "WeatherData");
    return humidities;
  }

  ///Returns the previous 5 days of nullable precipitation
  List<double?> getPastFiveDayPrecipitation() {
    List<double?> precipitation = List.empty(growable: true);
    for (PreviousDay day in _pastDays.where((day) => _isPastFiveDays(day))) {
      precipitation.add(day.humidity['mean']);
    }
    log("Found ${precipitation.length} precipitations in range",
        name: "WeatherData");
    return precipitation;
  }
}
