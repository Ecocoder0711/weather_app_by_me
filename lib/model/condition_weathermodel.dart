class ConditionWeatherModel {
  final String main;
  final String description;

  ConditionWeatherModel({required this.main, required this.description});

  ConditionWeatherModel.fromJson(Map<String, dynamic> json)
    : main = json['weather']['main'],
      description = json['weather']['description'];
}
