import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/data/models/weather/weather_model.dart';
import 'package:weather/screens/main/widgets/time_item.dart';
import 'package:weather/utils/extension/extensions.dart';
import 'package:weather/utils/styles/app_styles.dart';

class TimeOFDayWidget extends StatelessWidget {
  const TimeOFDayWidget({
    super.key,
    required this.weatherItem,
  });

  final WeatherModel weatherItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w, bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Today", style: AppStyles.semiBold20()),
              Text(weatherItem.weatherLocationModel.localtime.getMonthAndDate(), style: AppStyles.semiBold20()),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weatherItem.weatherForecast.forecastday[0].hour.length,
              itemBuilder: (context, index) {
                final item = weatherItem.weatherForecast.forecastday[0].hour[index];
                return TimeItem(icon: item.icon, tempC: item.tempC, time: item.time);
              },
            ),
          ),
        ),
      ],
    );
  }
}
