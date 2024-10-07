import 'package:flutter/material.dart';

import '../../../utils/export_link.dart';

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
