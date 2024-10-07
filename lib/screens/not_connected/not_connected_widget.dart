import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/utils/colors/app_colors.dart';
import 'package:weather/utils/images/app_image.dart';
import 'package:weather/utils/size/size_utils.dart';
import 'package:weather/utils/styles/app_styles.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class NotConnectedWidget extends StatelessWidget {
  final Function() onTap;
  const NotConnectedWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImage.notConnected),
        20.getH(),
        ZoomTapAnimation(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            width: double.infinity,
            height: 56.h,
            decoration: BoxDecoration(
              color: AppColors.cDDB130,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Text(
              "Not Internet",
              style: AppStyles.medium20().copyWith(
                color: AppColors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
