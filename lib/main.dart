import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/runapp.dart';

void main() {
  runApp(ProviderScope(child: WeatherApp()));
}
