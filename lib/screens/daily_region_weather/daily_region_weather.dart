import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/regions_weather/regions_weather_bloc.dart';
import 'package:weather/screens/daily_region_weather/widgets/daily_weather_item.dart';
import 'package:weather/screens/daily_region_weather/widgets/search_regions.dart';
import 'package:weather/utils/colors/app_colors.dart';
import 'package:weather/utils/size/size_utils.dart';

class DailyRegionWeather extends StatefulWidget {
  const DailyRegionWeather({super.key});

  @override
  State<DailyRegionWeather> createState() => _DailyRegionWeatherState();
}

class _DailyRegionWeatherState extends State<DailyRegionWeather> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
          child: CustomScrollView(
            slivers: [
              SearchRegion(
                onChangeValue: (value) {
                  context.read<RegionsWeatherBloc>().add(RegionsWeatherQuery(query: value));
                },
                onClearValue: () {
                  searchController.clear();
                },
              ),
              BlocBuilder<RegionsWeatherBloc, RegionsWeatherState>(
                builder: (context, state) {
                  if (state is RegionsWeatherLoading) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                        ),
                      ),
                    );
                  }
                  if (state is RegionsWeatherSuccess) {
                    return SliverList.list(
                      children: List.generate(
                        state.regionsWeatherData.length,
                        (index) {
                          final weatherItems = state.regionsWeatherData[index];
                          return RegionsWeatherItem(weatherItems: weatherItems);
                        },
                      ),
                    );
                  }

                  if (state is RegionsWeatherError) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(state.errorMassage),
                      ),
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
