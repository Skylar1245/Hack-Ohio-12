class Day {
  final int dt;
  final Map<String, dynamic> main;
  final Map<String, dynamic> winds;
  final Map<String, dynamic> clouds;
  final List<dynamic> weather;
  final Map<String, dynamic> rain;

  Day({
    required this.dt,
    required this.main,
    required this.winds,
    required this.clouds,
    required this.weather,
    required this.rain,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    Day d = Day(
      dt: json['dt'],
      main: json['main'] ?? {},
      winds: json['wind'] ?? {},
      clouds: json['clouds'] ?? {},
      weather: json['weather'] ?? {},
      rain: json['rain'] ?? {},
    );
    return d;
  }

  static bool matchesHour(Day day) {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (now.minute > 30) {
      hour++;
    }
    return DateTime.fromMillisecondsSinceEpoch(day.dt).hour == hour;
  }

  // Method to create a list of Day objects from a list of JSON data
  static List<Day> fromJsonList(List<dynamic> jsonList) {
    List<Day> list = jsonList.map((json) => Day.fromJson(json)).toList();

    List<Day> filteredList = list.where(matchesHour).toList();
    // Sort the filtered list by date (oldest first)
    filteredList.sort((a, b) => DateTime.fromMillisecondsSinceEpoch(a.dt)
        .compareTo(DateTime.fromMillisecondsSinceEpoch(b.dt)));

    return filteredList;
  }

  int month() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dt * 1000)
        .subtract(Duration(hours: 5));

    return date.month;
  }

  int day() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dt * 1000)
        .subtract(Duration(hours: 5));
    return date.day;
  }

  num pressure() {
    return main["pressure"];
  }

  num humidity() {
    return main["humidity"];
  }

  num temperature() {
    return main["temp"];
  }

  num wind() {
    return winds["speed"];
  }

  num precipitation() {
    if (rain.isNotEmpty) {
      return rain["1h"];
    } else {
      return 0;
    }
  }
}
