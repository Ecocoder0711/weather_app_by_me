import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/services/weather_state.dart';

class WeatherNotifier extends Notifier<WeatherState> {
  final WeatherServices _weatherServices = WeatherServices();

  @override
  WeatherState build() {
    // Return the initial state here instead of calling super()
    return WeatherState();
  }

  Future<void> getWeather(String cityname) async {
    if (cityname.trim().isEmpty) {
      state = state.copyWith(
        errorMessage: "Please enter a city name",
        weather: null,
      );
      return;
    }

    // Set loading state
    state = state.copyWith(isLoading: true, errorMessage: '', weather: null);

    try {
      final weather = await _weatherServices.getWeatherData(cityname);
      state = state.copyWith(
        isLoading: false,
        errorMessage: '',
        weather: weather,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        weather: null,
      );
    }
  }
}

final weatherProvider = NotifierProvider<WeatherNotifier, WeatherState>(() {
  return WeatherNotifier();
});
