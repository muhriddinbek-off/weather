import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/utils/colors/app_colors.dart';
import 'package:weather/utils/size/size_utils.dart';
import 'package:weather/utils/styles/app_styles.dart';

class WeatherStatesItem extends StatelessWidget {
  const WeatherStatesItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.white, width: 0.5),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.liner1,
              AppColors.liner2,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 24.h,
                ),
                10.getW(),
                Text(
                  title,
                  style: AppStyles.regular16().copyWith(fontSize: 12.sp),
                ),
              ],
            ),
            Text(
              value,
              style: AppStyles.regular24().copyWith(fontSize: 30.sp),
            ),
            Text(
              "In last hour",
              style: AppStyles.regular16(),
            ),
          ],
        ),
      ),
    );
  }
}
