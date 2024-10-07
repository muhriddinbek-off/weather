import 'package:flutter/material.dart';
import '../../utils/export_link.dart';

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
