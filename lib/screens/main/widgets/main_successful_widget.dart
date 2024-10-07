import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/data/models/weather/weather_model.dart';
import 'package:weather/screens/main/widgets/time_of_day_widget.dart';
import 'package:weather/screens/screen_routes.dart';
import 'package:weather/utils/colors/app_colors.dart';
import 'package:weather/utils/icons/app_icons.dart';
import 'package:weather/utils/images/app_image.dart';
import 'package:weather/utils/size/size_utils.dart';
import 'package:weather/utils/styles/app_styles.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MainSuccessfullWidget extends StatelessWidget {
  const MainSuccessfullWidget({
    super.key,
    required this.weatherItem,
  });

  final WeatherModel weatherItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        30.getH(),
        Image.network(
          "https:${weatherItem.weatherCurrent.icon}",
          height: height * 0.15,
          fit: BoxFit.fill,
        ),
        Text(
          "${weatherItem.weatherCurrent.tempC.toInt()}°",
          style: AppStyles.bold64(),
        ),
        Text(
          weatherItem.weatherLocationModel.region,
          style: AppStyles.regular24(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Min: ${weatherItem.weatherForecast.forecastday[0].day.mintempC.toInt()}°",
              style: AppStyles.regular24(),
            ),
            20.getW(),
            Text(
              "Max: ${weatherItem.weatherForecast.forecastday[0].day.maxtempC.toInt()}°",
              style: AppStyles.regular24(),
            ),
          ],
        ),
        const Spacer(),
        Image.asset(
          AppImage.house,
          height: height * 0.2,
        ),
        Container(
          height: height * 0.27,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(30.r),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.liner1,
                AppColors.liner2,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.2),
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TimeOFDayWidget(weatherItem: weatherItem),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getBottomTap(() {
                Navigator.pushNamed(context, RouteName.regionScreen);
              }, AppIcons.location),
              getBottomTap(() {
                Navigator.pushNamed(context, RouteName.dailyRegionWeather);
              }, AppIcons.plusCircle),
              getBottomTap(() {
                Navigator.pushNamed(context, RouteName.weekScreen);
              }, AppIcons.menu),
            ],
          ),
        ),
      ],
    );
  }

  ZoomTapAnimation getBottomTap(Function() onTap, String icons) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: SvgPicture.asset(icons),
    );
  }
}
