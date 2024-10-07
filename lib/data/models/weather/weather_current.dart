class WeatherCurrent {
  final num tempC;
  final String text;
  final String icon;
  WeatherCurrent({
    required this.icon,
    required this.tempC,
    required this.text,
  });
  factory WeatherCurrent.fromJson(Map<String, dynamic> json) {
    return WeatherCurrent(
      icon: json["condition"]["icon"] as String? ?? "",
      tempC: json["temp_c"] as num? ?? 0,
      text: json["condition"]["text"] as String? ?? "",
    );
  }
}
