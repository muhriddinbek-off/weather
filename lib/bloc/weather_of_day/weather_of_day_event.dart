part of 'weather_of_day_bloc.dart';

@immutable
sealed class WeatherOfDayEvent {}

final class FetchWeatherOfDayEvent extends WeatherOfDayEvent {
  final String regionName;
  FetchWeatherOfDayEvent(
    this.regionName,
  );
}

final class FetchWeekWeatherEvent extends WeatherOfDayEvent {}
