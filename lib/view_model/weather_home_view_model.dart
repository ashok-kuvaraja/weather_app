import 'dart:convert';

import 'package:weather_app/model/weather_info_details.dart';
import 'package:weather_app/model/weather_info.dart';
import 'package:http/http.dart' as http;

class HomeViewModel {
  HomeViewModel._();

  static HomeViewModel instance = HomeViewModel._();

  factory HomeViewModel() {
    return instance;
  }

  Future<WeatherInfo?> getWeatherInfo() async {
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=CHENNAI&appid=c5c630a04ee4f1aae71728d960e807c3'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return WeatherInfo.fromJson(jsonResponse);
    }
    return null;
  }

  WeatherInfoDetails getRecentRecord(WeatherInfo info) {
    return WeatherInfoDetails(
      temp: info.list.last.main.temp.toString(),
      maxTemp: info.list.last.main.tempMax.toString(),
      minTemp: info.list.last.main.tempMin.toString(),
      wind: info.list.last.wind.speed.toString(),
      visibility: info.list.last.visibility.toString(),
    );
  }
}
