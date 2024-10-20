import 'dart:convert';

import 'package:hackohio12/Weather/Day.dart';
import 'package:hackohio12/Weather/weather_analysis.dart';
import 'package:hackohio12/permissions.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

///Specialized implementation of https://pub.dev/packages/weather
///leveraging https://pub.dev/packages/geolocator for location services
class WeatherData {
  ///Private [WeatherFactory] to read from
  final WeatherFactory _weatherFactory;

  ///Location String
  String? _location;

  ///User Latitude
  double _userLatitude = 0;
  //User Longitude
  double _userLongitude = 0;

  ///Weather forecast of 5 days
  List<Weather> _futureForecast = List.empty(growable: true);

  ///Weather forecast from 5 days in the past
  List<Day> _pastDays = List.empty(growable: true);

  ///OpenWeatherMap API key obtained for free at
  ///https://openweathermap.org/price
  static final String _apiKey = "6bc5a74652a7e36c118775e11f341534";

  ///Constructor
  WeatherData() : _weatherFactory = WeatherFactory(_apiKey);

  ///Fills all data fields of the [WeatherData]
  Future<bool> initialize() async {
    await _populateFields();
    return true;
  }

  ///Updates this class's user location members
  Future<void> _populateFields() async {
    Permissions.requestLocationPermission();
    GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
    Position position = await geolocatorPlatform.getCurrentPosition();
    _userLatitude = position.latitude;
    _userLongitude = position.longitude;
    //populate future weather
    _futureForecast = await _weatherFactory.fiveDayForecastByLocation(
        _userLatitude, _userLongitude);

    List<int> pastDaysInEpoch = List.empty(growable: true);
    for (int i = 1; i < 6; i++) {
      int start = 0;

      DateTime date = DateTime.now().toUtc().subtract(Duration(days: i));
      int end = date.millisecondsSinceEpoch;
      //log("${DateTime.fromMillisecondsSinceEpoch(end)}", name: "WeatherData");
      pastDaysInEpoch.add(end);

      String url =
          'https://history.openweathermap.org/data/2.5/history/city?lat=$_userLatitude&lon=$_userLongitude&type=day&start=$start&end=$end&appid=$_apiKey';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Decode the response body into a Map<String, dynamic>
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // Extract the 'list' field, which should be a List<dynamic>
        List<dynamic> dayList = jsonResponse['list'];

        // Call fromJsonList with the extracted list
        _pastDays = Day.fromJsonList(dayList);
      } else {
        throw Exception("OpenWeather did not reply");
      }
    }
    int limit = 1;
    String geoUrl =
        'http://api.openweathermap.org/geo/1.0/reverse?lat=$_userLatitude&lon=$_userLongitude&limit=$limit&appid=$_apiKey';
    final geoResponse = await http.get(Uri.parse(geoUrl));

    if (geoResponse.statusCode == 200) {
      // Decode the response body into a Map<String, dynamic>
      List<dynamic> jsonResponse = jsonDecode(geoResponse.body);

      _location = jsonResponse.first["name"] ?? ":(";
    } else {
      throw Exception("OpenWeather did not reply");
    }
    WeatherAnalysis.initialize();
  }

  String getLocation() {
    return _location!;
  }

  ///Returns the upcoming 5 days of  pressures
  List<num> getUpcomingPressures() {
    List<num> pressures = List.empty(growable: true);
    for (Weather w in _futureForecast) {
      pressures.add(w.pressure!);
    }
    return pressures;
  }

  ///Returns the upcoming 5 days of humidities
  List<num> getUpcomingHumidities() {
    List<num> humidities = List.empty(growable: true);
    for (Weather w in _futureForecast) {
      humidities.add(w.humidity!);
    }
    return humidities;
  }

  ///Returns the upcoming 5 days of temperatures
  List<num> getUpcomingTemperatures() {
    List<num> temperatures = List.empty(growable: true);

    // Sort by date, placing today first and future dates in ascending order
    _futureForecast.sort((a, b) {
      return a.date!.compareTo(b.date!);
    });

    for (int i = 0; i < _futureForecast.length; i++) {
      Weather w = _futureForecast.elementAt(i);
      temperatures.add(w.temperature?.fahrenheit ?? 0.0);
    }

    return temperatures;
  }

  ///Returns the upcoming 5 days of rain
  List<num> getUpcomingPrecipitations() {
    List<num> precipitations = List.empty(growable: true);
    for (Weather w in _futureForecast) {
      if (w.rainLast3Hours == null) {
        precipitations.add(0.0);
      } else {
        precipitations.add(w.rainLast3Hours!);
      }
    }
    return precipitations;
  }

  ///Returns the upcoming 5 days of wind speeds
  List<num> getUpcomingWindSpeeds() {
    List<num> windSpeeds = List.empty(growable: true);
    for (Weather w in _futureForecast) {
      windSpeeds.add(w.windSpeed!);
    }
    return windSpeeds;
  }

  ///utility method to get consistence across past and future
  bool _isPastFiveDays(Day day) {
    DateTime lowerBound = DateTime.now().subtract(const Duration(days: 5));
    DateTime upperBound = DateTime.now();
    DateTime dayDate = DateTime(DateTime.now().year, day.month(), day.day());
    if (dayDate.isAfter(lowerBound) && dayDate.isBefore(upperBound)) {
      return true;
    } else {
      return false;
    }
  }

  ///Returns the previous 5 days of pressures
  List<num> getPastPressures() {
    List<num> pressures = List.empty(growable: true);
    Iterable<Day> days = _pastDays.where((day) => _isPastFiveDays(day));
    for (Day day in days) {
      pressures.add(day.pressure());
    }
    return pressures;
  }

  ///Returns the previous 5 days of humidity
  List<num> getPastHumidities() {
    List<num> humidities = List.empty(growable: true);
    for (Day day in _pastDays.where((day) => _isPastFiveDays(day))) {
      humidities.add(day.humidity());
    }
    return humidities;
  }

  ///Returns the previous 5 days of temperatures
  List<num> getPastTemperatures() {
    List<num> temperatures = List.empty(growable: true);
    for (Day day in _pastDays.where((day) => _isPastFiveDays(day))) {
      temperatures.add(day.temperature());
    }
    return temperatures;
  }

  ///Returns the previous 5 days of precipitation
  List<num> getPastPrecipitations() {
    List<num> precipitation = List.empty(growable: true);
    for (Day day in _pastDays.where((day) => _isPastFiveDays(day))) {
      precipitation.add(day.precipitation());
    }
    return precipitation;
  }

  ///Returns the previous 5 days of wind speeds
  List<num> getPastWindSpeeds() {
    List<num> windSpeeds = List.empty(growable: true);
    for (Day day in _pastDays.where((day) => _isPastFiveDays(day))) {
      windSpeeds.add(day.wind());
    }
    return windSpeeds;
  }
}
