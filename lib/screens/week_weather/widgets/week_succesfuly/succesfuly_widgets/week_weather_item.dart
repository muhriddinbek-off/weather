import 'package:flutter/material.dart';

import '../../../../../utils/export_link.dart';

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
