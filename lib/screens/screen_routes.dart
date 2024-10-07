import 'package:flutter/material.dart';
import '../utils/export_link.dart';

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
