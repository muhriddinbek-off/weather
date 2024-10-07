import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../utils/export_link.dart';

part 'weather_of_day_event.dart';
part 'weather_of_day_state.dart';

class WeatherOfDayBloc extends Bloc<WeatherOfDayEvent, WeatherOfDayState> {
  WeatherRepository weatherRepository;
  WeatherOfDayBloc({required this.weatherRepository}) : super(WeatherOfDayInitial()) {
    on<FetchWeatherOfDayEvent>(_getWeatetherDayData);
    on<FetchWeekWeatherEvent>(_getWeekWeatherData);
  }

  Future<void> _getWeatetherDayData(FetchWeatherOfDayEvent event, Emitter<WeatherOfDayState> emit) async {
    emit(WeatherOfDayLoading());
    MyRespons myRespons = await weatherRepository.weatherData(event.regionName);
    try {
      if (myRespons.data != null) {
        WeatherModel weatherModel = WeatherModel.fromJson(jsonDecode(myRespons.data));
        emit(WeatherOfDaySuccess(weatherModel: weatherModel));
      } else {
        emit(WeatherOfDayError("xato"));
      }
    } catch (error) {
      emit(WeatherOfDayError(error.toString()));
    }
  }

  Future<void> _getWeekWeatherData(FetchWeekWeatherEvent event, Emitter<WeatherOfDayState> emit) async {
    emit(WeatherOfDayLoading());
    MyRespons myRespons = await weatherRepository.weekWeatherData();
    try {
      if (myRespons.data != null) {
        WeatherModel weatherModel = WeatherModel.fromJson(jsonDecode(myRespons.data));
        emit(WeatherOfDaySuccess(weatherModel: weatherModel));
      } else {
        emit(WeatherOfDayError("xato"));
      }
    } catch (error) {
      emit(WeatherOfDayError(error.toString()));
    }
  }
}
