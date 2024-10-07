import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather/screens/daily_region_weather/daily_region_weather.dart';
import 'package:weather/screens/main/main_screen.dart';
import 'package:weather/screens/regions/regions_screen.dart';
import 'package:weather/screens/splash/splash_screen.dart';
import 'package:weather/screens/week_weather/week_weather_screen.dart';

class ScreenRoutes {
  static Route screenRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteName.main:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case RouteName.weekScreen:
        return PageTransition(
          child: const WeekWeatherScreen(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 300),
        );
      case RouteName.regionScreen:
        return PageTransition(
          child: const RegionsScreen(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 300),
        );
      case RouteName.dailyRegionWeather:
        return PageTransition(
          child: const DailyRegionWeather(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 300),
        );
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}

class RouteName {
  static const String splash = "/";
  static const String main = "/main";
  static const String weekScreen = "/week_screen";
  static const String regionScreen = "/region_screen";
  static const String dailyRegionWeather = "/daily_region_weather";
}
