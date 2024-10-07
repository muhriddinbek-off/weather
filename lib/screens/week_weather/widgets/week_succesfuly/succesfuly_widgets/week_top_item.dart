import 'package:flutter/material.dart';

import '../../../../../utils/export_link.dart';

class WeekTopItem extends StatelessWidget {
  const WeekTopItem({
    super.key,
    required this.weatherData,
  });

  final WeatherModel weatherData;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            50.getH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weatherData.weatherLocationModel.region,
                  style: AppStyles.regular24(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Min: ${weatherData.weatherForecast.forecastday[0].day.mintempC.toInt()}°",
                  style: AppStyles.regular24(),
                ),
                20.getW(),
                Text(
                  "Max: ${weatherData.weatherForecast.forecastday[0].day.maxtempC.toInt()}°",
                  style: AppStyles.regular24(),
                ),
              ],
            ),
            30.getH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "7-Days Forecasts",
                  style: AppStyles.bold24(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
