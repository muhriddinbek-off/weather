import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/weather_of_day/weather_of_day_bloc.dart';
import 'package:weather/screens/not_connected/not_connected_widget.dart';
import 'package:weather/screens/week_weather/widgets/week_successfuly_widget.dart';
import 'package:weather/utils/colors/app_colors.dart';
import 'package:weather/utils/size/size_utils.dart';

class WeekWeatherScreen extends StatefulWidget {
  const WeekWeatherScreen({super.key});

  @override
  State<WeekWeatherScreen> createState() => _WeekWeatherScreenState();
}

class _WeekWeatherScreenState extends State<WeekWeatherScreen> {
  @override
  void initState() {
    context.read<WeatherOfDayBloc>().add(FetchWeekWeatherEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                final weatherData = state.weatherModel;
                return WeekSuccessfulyWidget(weatherData: weatherData);
              }
              if (state is WeatherOfDayError) {
                return NotConnectedWidget(
                  onTap: () {
                    context.read<WeatherOfDayBloc>().add(FetchWeekWeatherEvent());
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
