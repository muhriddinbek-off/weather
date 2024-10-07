import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/data/models/weather/weather_model.dart';
import 'package:weather/screens/week_weather/widgets/daily_weather_information.dart';
import 'package:weather/screens/week_weather/widgets/week_top_item.dart';
import 'package:weather/screens/week_weather/widgets/week_weather_item.dart';
import 'package:weather/utils/colors/app_colors.dart';

class WeekSuccessfulyWidget extends StatelessWidget {
  const WeekSuccessfulyWidget({
    super.key,
    required this.weatherData,
  });

  final WeatherModel weatherData;

  @override
  Widget build(BuildContext context) {
    final sunTime = weatherData.weatherForecast.forecastday[0];
    return CustomScrollView(
      slivers: [
        WeekTopItem(weatherData: weatherData),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: const Divider(),
          ),
        ),
        SliverList.builder(
          itemCount: weatherData.weatherForecast.forecastday.length,
          itemBuilder: (context, index) {
            final weekItem = weatherData.weatherForecast.forecastday[index];
            return WeekWeatherDataItem(
              weekItem: weekItem,
              weatherData: weatherData,
              minTemp: weekItem.day.mintempC,
              maxTemp: weekItem.day.maxtempC,
            );
          },
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: const Divider(),
          ),
        ),
        DailyWeatherInfomation(sunTime: sunTime),
        SliverToBoxAdapter(
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.white,
              size: 40.h,
            ),
          ),
        ),
      ],
    );
  }
}
