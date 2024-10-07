import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/weather_of_day/weather_of_day_bloc.dart';
import 'package:weather/data/storages/storages_repository.dart';
import 'package:weather/screens/main/widgets/main_successful_widget.dart';
import 'package:weather/screens/not_connected/not_connected_widget.dart';
import 'package:weather/utils/colors/app_colors.dart';
import 'package:weather/utils/constants/app_constantas.dart';
import 'package:weather/utils/size/size_utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void getRegionInitialValue() {
    if (StorageRepository.getString(key: AppConstantas.regionName).isEmpty) {
      StorageRepository.setString(key: AppConstantas.regionName, value: "Toshkent");
    } else {
      StorageRepository.getString(key: AppConstantas.regionName);
    }
  }

  @override
  void initState() {
    getRegionInitialValue();
    context.read<WeatherOfDayBloc>().add(FetchWeatherOfDayEvent(StorageRepository.getString(key: AppConstantas.regionName)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.liner1,
                AppColors.liner2,
              ],
            ),
          ),
          child: BlocBuilder<WeatherOfDayBloc, WeatherOfDayState>(
            builder: (context, state) {
              if (state is WeatherOfDayLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                );
              }
              if (state is WeatherOfDaySuccess) {
                final weatherItem = state.weatherModel;
                return MainSuccessfullWidget(weatherItem: weatherItem);
              }
              if (state is WeatherOfDayError) {
                return NotConnectedWidget(
                  onTap: () {
                    getRegionInitialValue();
                    context.read<WeatherOfDayBloc>().add(FetchWeatherOfDayEvent(StorageRepository.getString(key: AppConstantas.regionName)));
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
