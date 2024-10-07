import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/data/models/weather/weather_forecast.dart';
import 'package:weather/data/models/weather/weather_model.dart';
import 'package:weather/utils/extension/extensions.dart';
import 'package:weather/utils/icons/app_icons.dart';
import 'package:weather/utils/size/size_utils.dart';
import 'package:weather/utils/styles/app_styles.dart';

class WeekWeatherDataItem extends StatelessWidget {
  const WeekWeatherDataItem({
    super.key,
    required this.weekItem,
    required this.weatherData,
    required this.maxTemp,
    required this.minTemp,
  });

  final Forecastday weekItem;
  final WeatherModel weatherData;
  final num minTemp;
  final num maxTemp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.25,
            child: Text(
              weekItem.data.getDayName(),
              style: AppStyles.regular16(),
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(AppIcons.rainFall),
              6.getW(),
              Text(
                "${weekItem.day.dailyChanceOfRain}%",
                style: AppStyles.regular16(),
              ),
            ],
          ),
          Image.network("https:${weekItem.day.icon}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${minTemp.toInt()}°",
                style: AppStyles.regular16(),
              ),
              6.getW(),
              Text(
                "${maxTemp.toInt()}°",
                style: AppStyles.regular16(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
