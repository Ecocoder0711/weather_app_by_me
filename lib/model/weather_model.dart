import 'package:weather_app/model/condition_weathermodel.dart';
import 'package:weather_app/model/main_weathermodel.dart';

class WeatherModel {
  final String cityName;
  final String countryName;
  final ConditionWeatherModel condition;
  final MainWeatherModel main;

  WeatherModel({
    required this.cityName,
    required this.countryName,
    required this.condition,
    required this.main,
  });

  WeatherModel.fromJson(Map<String, dynamic> json)
    : cityName = json['name'],
      countryName = json['sys']['country'],
      condition = ConditionWeatherModel.fromJson(json['weather'][0]),
      main = MainWeatherModel.fromJson(json['main']);
}
