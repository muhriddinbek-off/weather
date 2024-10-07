import 'package:flutter/material.dart';

import '../../utils/export_link.dart';

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
