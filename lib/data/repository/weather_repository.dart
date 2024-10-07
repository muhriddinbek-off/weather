import 'package:weather/data/models/my_response/my_respons.dart';
import 'package:weather/data/network/api_provider/api_provider.dart';

class WeatherRepository {
  Future<MyRespons> weatherData(String regionName) async => await ApiProvider.getLocalWeatherData(regionName);
  Future<MyRespons> weekWeatherData() async => await ApiProvider.getWeekWeatherData();
}
