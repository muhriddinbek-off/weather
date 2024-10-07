import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:weather/data/models/my_response/my_respons.dart';
import 'package:weather/data/models/weather/weather_model.dart';
import 'package:weather/data/repository/weather_repository.dart';
part 'regions_weather_event.dart';
part 'regions_weather_state.dart';

class RegionsWeatherBloc extends Bloc<RegionsWeatherEvent, RegionsWeatherState> {
  final WeatherRepository weatherRepository;
  RegionsWeatherBloc({required this.weatherRepository}) : super(RegionsWeatherInitial()) {
    on<FetchRegionWeatherData>(_getRegionsWeatherData);
    on<RegionsWeatherQuery>(_getRegionQuery);
  }

  List<WeatherModel> regionsData = [];
  Future<void> _getRegionsWeatherData(FetchRegionWeatherData event, Emitter<RegionsWeatherState> emit) async {
    try {
      for (String region in event.regionsName) {
        MyRespons myRespons = await weatherRepository.weatherData(region);
        if (myRespons.data != null) {
          WeatherModel weatherModel = WeatherModel.fromJson(jsonDecode(myRespons.data));
          regionsData.add(weatherModel);
        } else {
          throw Exception("Malumotni yuklashda xato");
        }
        emit(RegionsWeatherSuccess(regionsWeatherData: regionsData));
      }
    } catch (e) {
      emit(RegionsWeatherError(e.toString()));
    }
  }

  List<WeatherModel> filterRegions = [];
  _getRegionQuery(RegionsWeatherQuery event, Emitter<RegionsWeatherState> emit) {
    if (event.query.isEmpty) {
      filterRegions = regionsData;
      emit(RegionsWeatherSuccess(regionsWeatherData: filterRegions));
    } else {
      filterRegions = regionsData.where((item) => item.weatherLocationModel.region.toLowerCase().contains(event.query.toLowerCase())).toList();
      emit(RegionsWeatherSuccess(regionsWeatherData: filterRegions));
    }
  }
}
