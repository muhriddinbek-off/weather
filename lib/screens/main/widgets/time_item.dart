import 'package:flutter/material.dart';
import 'package:weather/utils/export_link.dart';

class TimeItem extends StatelessWidget {
  const TimeItem({
    super.key,
    required this.icon,
    required this.tempC,
    required this.time,
  });

  final num tempC;
  final String time;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${tempC.toInt()}°C", style: AppStyles.medium20()),
          Image.network("https:$icon"),
          Text(
            time.getTime(),
            style: AppStyles.medium20(),
          ),
        ],
      ),
    );
  }
}
