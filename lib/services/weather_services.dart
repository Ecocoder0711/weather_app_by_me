import 'dart:convert';

import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/secrets.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  // constant value {api key, URL, const objs};

  // function

  Future<WeatherModel?> getWeatherData(String cityname) async {
    final String baseUrl = "https://api.openweathermap.org/data/2.5";
    final String apiId = openWeatherApiKey;
    // URL
    // Response (json)
    // Conditionaly data fetch (status == 200)
    try {
      String url = '$baseUrl/weather?q=$cityname&appid=$apiId&units=metric';
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // success state
        Map<String, dynamic> jsonData =
            jsonDecode(response.body) as Map<String, dynamic>;
        //
        return WeatherModel.fromJson(jsonData);
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
