import 'package:flutter/material.dart';

import '../../utils/export_link.dart';

class RegionsScreen extends StatelessWidget {
  const RegionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.liner1,
                AppColors.liner2,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(child: Container()),
                const RegionsTopPart(),
                30.getH(),
                ...List.generate(
                  countryGeocodes.keys.length,
                  (index) {
                    debugPrint(StorageRepository.getString(key: AppConstantas.regionName));
                    String regionName = StorageRepository.getString(key: AppConstantas.regionName);
                    List<String> items = [];
                    countryGeocodes.keys.map((e) => items.add(e)).toList();
                    return ZoomTapAnimation(
                      onTap: () async {
                        StorageRepository.setString(key: AppConstantas.regionName, value: items[index]);
                        Navigator.pushNamed(context, RouteName.main);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        margin: EdgeInsets.only(bottom: 20.h, left: 16.w, right: 16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              regionName == items[index] ? AppColors.cDDB130 : AppColors.liner1,
                              AppColors.liner2,
                            ],
                          ),
                        ),
                        child: ListTile(
                          leading: Text("${index + 1}.", style: AppStyles.medium20()),
                          title: Text(
                            items[index],
                            style: AppStyles.medium20(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
