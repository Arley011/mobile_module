import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_module/models/weather.dart';

class WeatherRepo {
  static const apiKey = '377633bc9e64fa98d6a2e0d6712470b9';
  static const rootUrl = 'http://api.openweathermap.org/';
  static const weatherEndpoint = 'data/2.5/weather/?';
  static const imgEndpoint = 'img/w/';

  Future<WeatherModel> getWeatherInCity(String city) async {
    var data = await http
        .get('$rootUrl${weatherEndpoint}q=$city&appid=$apiKey&units=metric');
    var weatherData = json.decode(data.body);
    var iconId = weatherData['weather'][0]['icon'];
    var iconUrl = '$rootUrl$imgEndpoint$iconId';
    print(weatherData['wind']);
    weatherData['iconUrl'] = iconUrl;
    var weather = WeatherModel.fromJson(weatherData);
    print(weather.city.cityName);
    print(weather.weatherIconUrl);
    return weather;
  }
}
