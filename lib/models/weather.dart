class City {
  final String cityName;
  final int cityId;
  final double longitude;
  final double latitude;

  City({this.cityName, this.cityId, this.longitude, this.latitude});

  factory City.fromJson(Map<String, dynamic> map) {
    return City(
        cityName: map['name'],
        cityId: map['id'],
        latitude: map['coord']['lat'],
        longitude: map['coord']['lon']);
  }
}

class WeatherModel {
  final City city;
  final String weatherStr;
  final String weatherIconUrl;

  final double temp;
  final double windSpeed;
  final int humidity;

  final int clouds;

  WeatherModel(
      {this.city,
      this.weatherStr,
      this.weatherIconUrl,
      this.temp,
      this.windSpeed,
      this.humidity,
      this.clouds});

  factory WeatherModel.fromJson(Map<String, dynamic> map) {
    return WeatherModel(
      city: City.fromJson(map),
      weatherStr: map['weather'][0]['main'],
      weatherIconUrl: map['iconUrl'],
      temp: map['main']['temp'] as double,
      humidity: map['main']['humidity'],
      clouds: map['clouds']['all'],
      windSpeed: (map['wind']['speed'] as num).toDouble(),
    );
  }
}
