part of 'regions_weather_bloc.dart';

@immutable
sealed class RegionsWeatherState {}

final class RegionsWeatherInitial extends RegionsWeatherState {}

final class RegionsWeatherLoading extends RegionsWeatherState {}

final class RegionsWeatherSuccess extends RegionsWeatherState {
  final List<WeatherModel> regionsWeatherData;
  RegionsWeatherSuccess({required this.regionsWeatherData});
}

final class RegionsWeatherError extends RegionsWeatherState {
  final String errorMassage;
  RegionsWeatherError(this.errorMassage);
}
