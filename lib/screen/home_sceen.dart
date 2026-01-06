import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/provider/weather_provider.dart';

class Homesceen extends ConsumerStatefulWidget {
  const Homesceen({super.key});

  @override
  ConsumerState<Homesceen> createState() => _HomesceenState();
}

class _HomesceenState extends ConsumerState<Homesceen> {
  final TextEditingController _cityEditingController = TextEditingController();

  void _fetchWeather() {
    ref.read(weatherProvider.notifier).getWeather(_cityEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherProvider);
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('Weather App'),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 375,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: _fetchWeather,
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _cityEditingController,
                        decoration: InputDecoration(
                          hintText: "Enter City",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) => _fetchWeather(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Show loading indicator
            if (weatherState.isLoading) CircularProgressIndicator(),

            // Show error if any
            if (weatherState.errorMessage.isNotEmpty)
              Text(
                'Error: ${weatherState.errorMessage}',
                style: TextStyle(color: Colors.red),
              ),

            // Show weather data - accessing specific properties
            if (weatherState.weather != null) ...[
              Text(
                'City: ${weatherState.weather!.cityName}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Temp: ${weatherState.weather!.main.temp}°C',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Weather: ${weatherState.weather!.condition.description}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
