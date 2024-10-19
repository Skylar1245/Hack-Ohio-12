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

  ///Weather forecast from 5 days in the past
  List<PreviousDay> _pastDays = List.empty(growable: true);

  ///OpenWeatherMap API key obtained for free at
  ///https://openweathermap.org/price
  static final String _apiKey = "6bc5a74652a7e36c118775e11f341534";

  ///Constructor
  WeatherData() : _weatherFactory = WeatherFactory(_apiKey);

  ///Fills all data fields of the [WeatherData]
  Future<void> initialize() async {
    await _populateFields();
  }

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

  ///Returns the current pressure at time of call
  double getTodaysPressure() {
    return weather.pressure!;
  }

  ///Returns the current humidity at time of call
  double getTodaysHumidity() {
    return weather.humidity!;
  }

  ///Returns the current temperature at time of call
  Temperature getTodaysTemperature() {
    return weather.temperature!;
  }

  ///Returns the current precipitation at time of call
  double getTodaysPrecipitation() {
    return weather.rainLast3Hours!;
  }

  ///Returns the current wind speed at time of call
  double getTodaysWind() {
    return weather.windSpeed!;
  }

  ///Returns the upcoming 5 days of  pressures
  List<double> getUpcomingPressures() {
    List<double> pressures = List.empty(growable: true);
    for (Weather w in _futureForecast) {
      pressures.add(w.pressure!);
    }
    return pressures;
  }

  ///Returns the upcoming 5 days of humidities
  List<double> getUpcomingHumidities() {
    List<double> humidities = List.empty(growable: true);
    for (Weather w in _futureForecast) {
      humidities.add(w.humidity!);
    }
    return humidities;
  }

  ///Returns the upcoming 5 days of temperatures
  List<double> getUpcomingTemperatures() {
    List<double> humidities = List.empty(growable: true);
    for (Weather w in _futureForecast) {
      humidities.add(w.humidity!);
    }
    return humidities;
  }

  ///Returns the upcoming 5 days of rain
  List<double> getUpcomingPrecipitations() {
    List<double> precipitations = List.empty(growable: true);
    for (Weather w in _futureForecast) {
      precipitations.add(w.rainLast3Hours!);
    }
    return precipitations;
  }

  ///Returns the upcoming 5 days of wind speeds
  List<double> getUpcomingWindSpeeds() {
    List<double> windSpeeds = List.empty(growable: true);
    for (Weather w in _futureForecast) {
      windSpeeds.add(w.windSpeed!);
    }
    return windSpeeds;
  }

  ///utility method to get consistence across past and future
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

  ///Returns the previous 5 days of pressures
  List<double> getPastPressures() {
    List<double> pressures = List.empty(growable: true);
    Iterable<PreviousDay> days = _pastDays.where((day) => _isPastFiveDays(day));
    for (PreviousDay day in days) {
      pressures.add(day.pressure['mean']);
    }
    return pressures;
  }

  ///Returns the previous 5 days of humidity
  List<double> getPastHumidities() {
    List<double> humidities = List.empty(growable: true);
    for (PreviousDay day in _pastDays.where((day) => _isPastFiveDays(day))) {
      humidities.add(day.humidity['mean']);
    }
    return humidities;
  }

  ///Returns the previous 5 days of temperatures
  List<double> getPastTemperatures() {
    List<double> temperatures = List.empty(growable: true);
    for (PreviousDay day in _pastDays.where((day) => _isPastFiveDays(day))) {
      temperatures.add(day.temp['mean']);
    }
    return temperatures;
  }

  ///Returns the previous 5 days of precipitation
  List<double> getPastPrecipitations() {
    List<double> precipitation = List.empty(growable: true);
    for (PreviousDay day in _pastDays.where((day) => _isPastFiveDays(day))) {
      precipitation.add(day.precipitation['mean']);
    }
    return precipitation;
  }

  ///Returns the previous 5 days of wind speeds
  List<double> getPastWindSpeeds() {
    List<double> windSpeeds = List.empty(growable: true);
    for (PreviousDay day in _pastDays.where((day) => _isPastFiveDays(day))) {
      windSpeeds.add(day.wind['mean']);
    }
    return windSpeeds;
  }
}
