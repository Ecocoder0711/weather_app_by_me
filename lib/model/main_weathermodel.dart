class MainWeatherModel {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidiy;

  MainWeatherModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidiy,
  });

  MainWeatherModel.fromJson(Map<String, dynamic> json)
    : temp = (json['temp'] as num).toDouble(),
      feelsLike = (json['feels_like'] as num).toDouble(),
      tempMin = (json['temp_min'] as num).toDouble(),
      tempMax = (json['temp_max'] as num).toDouble(),
      pressure = json['pressure'],
      humidiy = json['humidity'];
}
