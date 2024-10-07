part of 'regions_weather_bloc.dart';

@immutable
sealed class RegionsWeatherEvent {}

final class FetchRegionWeatherData extends RegionsWeatherEvent {
  final List<String> regionsName;
  FetchRegionWeatherData({required this.regionsName});
}

final class RegionsWeatherQuery extends RegionsWeatherEvent {
  final String query;
  RegionsWeatherQuery({required this.query});
}
