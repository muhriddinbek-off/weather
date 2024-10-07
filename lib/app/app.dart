import 'package:flutter/material.dart';
import '../utils/export_link.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => WeatherRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WeatherOfDayBloc(weatherRepository: WeatherRepository())),
          BlocProvider(create: (context) => RegionsWeatherBloc(weatherRepository: WeatherRepository())..add(FetchRegionWeatherData(regionsName: countryGeocodes.keys.toList()))),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.splash,
          onGenerateRoute: ScreenRoutes.screenRoutes,
        );
      },
    );
  }
}
