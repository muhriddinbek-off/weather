import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/data/models/weather/weather_model.dart';
import 'package:weather/utils/images/app_image.dart';
import 'package:weather/utils/size/size_utils.dart';
import 'package:weather/utils/styles/app_styles.dart';

class RegionsWeatherItem extends StatelessWidget {
  const RegionsWeatherItem({
    super.key,
    required this.weatherItems,
  });

  final WeatherModel weatherItems;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Image.asset(AppImage.rectangle),
        ),
        Positioned(
          top: -20,
          right: 0,
          child: Image.network(
            "https:${weatherItems.weatherCurrent.icon}",
            width: width * 0.5,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 26.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${weatherItems.weatherCurrent.tempC.toInt()}°",
                style: AppStyles.bold64(),
              ),
              40.getH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Min: ${weatherItems.weatherForecast.forecastday[0].day.mintempC.toInt()}°",
                    style: AppStyles.medium20().copyWith(fontSize: 12.sp),
                  ),
                  20.getW(),
                  Text(
                    "Max: ${weatherItems.weatherForecast.forecastday[0].day.maxtempC.toInt()}°",
                    style: AppStyles.medium20().copyWith(fontSize: 12.sp),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${weatherItems.weatherLocationModel.region} ",
                    style: AppStyles.regular16(),
                  ),
                  Text(
                    "${weatherItems.weatherCurrent.text} ",
                    style: AppStyles.regular16(),
                  ),
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}
