import 'package:weather/data/models/weather/weather_current.dart';
import 'package:weather/data/models/weather/weather_forecast.dart';
import 'package:weather/data/models/weather/weather_location_model.dart';

class WeatherModel {
  final WeatherLocationModel weatherLocationModel;
  final WeatherForecast weatherForecast;
  final WeatherCurrent weatherCurrent;
  WeatherModel({
    required this.weatherLocationModel,
    required this.weatherForecast,
    required this.weatherCurrent,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      weatherLocationModel: WeatherLocationModel.fromJson(json["location"]),
      weatherForecast: WeatherForecast.fromJson(json["forecast"]),
      weatherCurrent: WeatherCurrent.fromJson(json["current"]),
    );
  }
}
