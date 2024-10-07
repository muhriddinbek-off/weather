import 'package:weather/data/models/my_response/my_respons.dart';
import 'package:http/http.dart' as http;
import 'package:weather/data/repository/geocode/country_gecods.dart';
import 'package:weather/data/storages/storages_repository.dart';
import 'package:weather/utils/constants/app_constantas.dart';

class ApiProvider {
  static Future<MyRespons> getLocalWeatherData(String regionName) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final geocode = countryGeocodes[regionName];
    double lat = geocode![0];
    double long = geocode[1];
    Uri uri = Uri.parse("${AppConstantas.baseUrl}key=${AppConstantas.key}&q=$lat&q=$long");
    try {
      http.Response response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        return MyRespons(data: response.body);
      }
      return MyRespons(
        errorMassage: "Internetingiz tarmoqqa ulanganini tekshiring",
      );
    } catch (e) {
      return MyRespons(errorMassage: e.toString());
    }
  }

  static Future<MyRespons> getWeekWeatherData() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    String regionName = StorageRepository.getString(key: AppConstantas.regionName);
    final geocode = countryGeocodes[regionName];
    double lat = geocode![0];
    double long = geocode[1];
    int days = 7;
    Uri uri = Uri.parse("${AppConstantas.baseUrl}key=${AppConstantas.key}&q=$lat&q=$long&days=$days");
    try {
      http.Response response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        return MyRespons(data: response.body);
      }
      return MyRespons(
        errorMassage: "Internetingiz tarmoqqa ulanganini tekshiring",
      );
    } catch (e) {
      return MyRespons(errorMassage: e.toString());
    }
  }
}
