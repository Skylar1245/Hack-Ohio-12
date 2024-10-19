class PreviousDay {
  final int cod;
  final int month;
  final int day;
  final Map<String, dynamic> temp;
  final Map<String, dynamic> pressure;
  final Map<String, dynamic> humidity;
  final Map<String, dynamic> wind;
  final Map<String, dynamic> precipitation;
  final Map<String, dynamic> clouds;

  const PreviousDay({
    required this.cod,
    required this.month,
    required this.day,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.wind,
    required this.precipitation,
    required this.clouds,
  });

  factory PreviousDay.fromJson(Map<String, dynamic> json) {
    try {
      return PreviousDay(
        cod: json['cod'],
        month: json['result'][0]['month'],
        day: json['result'][0]['day'],
        temp: json['result'][0]['temp'],
        pressure: json['result'][0]['pressure'],
        humidity: json['result'][0]['humidity'],
        wind: json['result'][0]['wind'],
        precipitation: json['result'][0]['precipitation'],
        clouds: json['result'][0]['clouds'],
      );
    } catch (e) {
      throw FormatException("Failed to load Previous Day: ${e.toString()}");
    }
  }

  static List<PreviousDay> fromJsonList(Map<String, dynamic> json) {
    try {
      final cod = json['cod'];
      final result = json['result'] as List<dynamic>;

      return result.map((dayJson) {
        return PreviousDay(
          cod: cod,
          month: dayJson['month'],
          day: dayJson['day'],
          temp: dayJson['temp'],
          pressure: dayJson['pressure'],
          humidity: dayJson['humidity'],
          wind: dayJson['wind'],
          precipitation: dayJson['precipitation'],
          clouds: dayJson['clouds'],
        );
      }).toList();
    } catch (e) {
      throw FormatException("Failed to load Previous Days: ${e.toString()}");
    }
  }
}
