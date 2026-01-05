class ConditionWeatherModel {
  final String main;
  final String description;

  ConditionWeatherModel({required this.main, required this.description});
}

class MainWeatherModel {
  final double temp;
  final double fealsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidiy;
  final int seaLevel;
  final int grndLevel;

  MainWeatherModel({
    required this.temp,
    required this.fealsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidiy,
    required this.seaLevel,
    required this.grndLevel,
  });
}

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
}
