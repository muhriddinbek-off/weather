class WeatherLocationModel {
  final String name;
  final String region;
  final String localtime;
  WeatherLocationModel({
    required this.name,
    required this.localtime,
    required this.region,
  });
  factory WeatherLocationModel.fromJson(Map<String, dynamic> json) {
    return WeatherLocationModel(
      name: json['name'] as String? ?? "",
      region: json['region'] as String? ?? "",
      localtime: json['localtime'] as String? ?? "",
    );
  }
}
