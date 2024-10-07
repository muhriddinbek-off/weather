import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/data/models/weather/weather_forecast.dart';
import 'package:weather/screens/week_weather/widgets/sunset_and_sunrise.dart';
import 'package:weather/screens/week_weather/widgets/weather_states_item.dart';
import 'package:weather/utils/icons/app_icons.dart';
import 'package:weather/utils/size/size_utils.dart';

class DailyWeatherInfomation extends StatelessWidget {
  const DailyWeatherInfomation({
    super.key,
    required this.sunTime,
  });

  final Forecastday sunTime;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SunsetAndSunrise(
                  title: "Sunrise",
                  time: sunTime.astro.sunrise,
                ),
                16.getW(),
                SunsetAndSunrise(
                  title: "Sunset",
                  time: sunTime.astro.sunset,
                ),
              ],
            ),
            20.getH(),
            Row(
              children: [
                WeatherStatesItem(
                  icon: AppIcons.windy,
                  title: "AIR QUALITY",
                  value: "${sunTime.day.maxwindMph.toInt()} km/h",
                ),
                16.getW(),
                WeatherStatesItem(
                  icon: AppIcons.visibility,
                  title: "UI index",
                  value: "${sunTime.day.uv.toInt()}",
                ),
              ],
            ),
            20.getH(),
            Row(
              children: [
                WeatherStatesItem(
                  icon: AppIcons.rainFall,
                  title: "Rain",
                  value: "${sunTime.day.dailyChanceOfRain.toInt()} %",
                ),
                16.getW(),
                WeatherStatesItem(
                  icon: AppIcons.uvIndex,
                  title: "Snow",
                  value: "${sunTime.day.dailyChanceOfSnow.toInt()} %",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
