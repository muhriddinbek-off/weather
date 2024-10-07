import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/utils/colors/app_colors.dart';
import 'package:weather/utils/icons/app_icons.dart';
import 'package:weather/utils/size/size_utils.dart';
import 'package:weather/utils/styles/app_styles.dart';

class SunsetAndSunrise extends StatelessWidget {
  const SunsetAndSunrise({
    super.key,
    required this.time,
    required this.title,
  });

  final String title;
  final String time;

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
                  AppIcons.star,
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
              time,
              style: AppStyles.regular24().copyWith(fontSize: 30.sp),
            ),
          ],
        ),
      ),
    );
  }
}
