part of 'weather_of_day_bloc.dart';

@immutable
sealed class WeatherOfDayState {}

final class WeatherOfDayInitial extends WeatherOfDayState {}

final class WeatherOfDayLoading extends WeatherOfDayState {}

final class WeatherOfDaySuccess extends WeatherOfDayState {
  final WeatherModel weatherModel;
  WeatherOfDaySuccess({
    required this.weatherModel,
  });
}

final class WeatherOfDayError extends WeatherOfDayState {
  final String errorMassage;
  WeatherOfDayError(this.errorMassage);
}
