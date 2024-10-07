import 'package:flutter/material.dart';
import 'package:weather/screens/main/widgets/main_successful_widget.dart';

import '../../utils/export_link.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void getRegionInitialValue() {
    if (StorageRepository.getString(key: AppConstantas.regionName).isEmpty) {
      StorageRepository.setString(key: AppConstantas.regionName, value: "Toshkent");
    } else {
      StorageRepository.getString(key: AppConstantas.regionName);
    }
  }

  @override
  void initState() {
    getRegionInitialValue();
    context.read<WeatherOfDayBloc>().add(FetchWeatherOfDayEvent(StorageRepository.getString(key: AppConstantas.regionName)));
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
          child: BlocBuilder<WeatherOfDayBloc, WeatherOfDayState>(
            builder: (context, state) {
              if (state is WeatherOfDayLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                );
              }
              if (state is WeatherOfDaySuccess) {
                final weatherItem = state.weatherModel;
                return MainSuccessfullWidget(weatherItem: weatherItem);
              }
              if (state is WeatherOfDayError) {
                return NotConnectedWidget(
                  onTap: () {
                    getRegionInitialValue();
                    context.read<WeatherOfDayBloc>().add(FetchWeatherOfDayEvent(StorageRepository.getString(key: AppConstantas.regionName)));
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
