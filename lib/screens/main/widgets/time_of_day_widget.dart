import 'package:flutter/material.dart';

import '../../../utils/export_link.dart';

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
