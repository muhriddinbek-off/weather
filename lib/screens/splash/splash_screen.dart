import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/screens/screen_routes.dart';
import 'package:weather/utils/colors/app_colors.dart';
import 'package:weather/utils/images/app_image.dart';
import 'package:weather/utils/size/size_utils.dart';
import 'package:weather/utils/styles/app_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> getNextPage() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.main,
            (context) => false,
          );
        }
      },
    );
  }

  @override
  void initState() {
    getNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImage.weather,
              ),
              20.getH(),
              Text(
                "Weather",
                style: AppStyles.bold64(),
              ),
              Text(
                "ForeCasts",
                style: AppStyles.bold64().copyWith(color: AppColors.cDDB130),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
