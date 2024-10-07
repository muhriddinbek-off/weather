import 'package:flutter/material.dart';

import '../../../utils/export_link.dart';

class SearchRegion extends StatelessWidget {
  const SearchRegion({
    super.key,
    required this.onChangeValue,
    required this.onClearValue,
  });
  final ValueChanged<String> onChangeValue;
  final Function() onClearValue;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      centerTitle: true,
      backgroundColor: AppColors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.white,
        ),
      ),
      title: Container(
        alignment: Alignment.center,
        height: 46.h,
        child: TextField(
          onChanged: onChangeValue,
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: AppStyles.regular16(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.r),
              borderSide: BorderSide(color: AppColors.black.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.r),
              borderSide: BorderSide(color: AppColors.black.withOpacity(0.3)),
            ),
            filled: true,
            fillColor: AppColors.black.withOpacity(0.3),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SvgPicture.asset(AppIcons.search),
            ),
            suffixIcon: IconButton(
              onPressed: onClearValue,
              icon: Icon(
                Icons.cancel,
                color: AppColors.white,
              ),
            ),
          ),
          style: AppStyles.regular16(),
        ),
      ),
    );
  }
}
