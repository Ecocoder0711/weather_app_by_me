import 'package:flutter_riverpod/legacy.dart';
import 'package:weather_app/services/weather_state.dart';

class WeatherNotifier extends StateNotifier<WeatherState> {
  WeatherNotifier() : super(WeatherState(isLoading: false, errorMessage: ''));
}
