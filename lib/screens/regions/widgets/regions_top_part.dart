import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/utils/colors/app_colors.dart';
import 'package:weather/utils/styles/app_styles.dart';

class RegionsTopPart extends StatelessWidget {
  const RegionsTopPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
            ),
          ),
          Text(
            "Regions",
            style: AppStyles.regular24(),
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}
