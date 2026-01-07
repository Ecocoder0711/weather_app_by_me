import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomeSceen extends ConsumerStatefulWidget {
  const HomeSceen({super.key});

  @override
  ConsumerState<HomeSceen> createState() => _HomesceenState();
}

class _HomesceenState extends ConsumerState<HomeSceen> {
  final TextEditingController _cityEditingController = TextEditingController();

  void _fetchWeather() {
    ref.read(weatherProvider.notifier).getWeather(_cityEditingController.text);
  }

  @override
  void dispose() {
    _cityEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherProvider);
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Weather App'),
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
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 375,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: _fetchWeather,
                      child: const Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _cityEditingController,
                        decoration: const InputDecoration(
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
            if (!weatherState.isLoading &&
                weatherState.errorMessage.isEmpty &&
                weatherState.weather == null)
              Container(
                width: 375,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.yellow, size: 64),
                    SizedBox(height: 8),
                    Text(
                      'Welcome to Weather App',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Enter a city name above to get current weather information',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

            // Show loading indicator
            if (weatherState.isLoading) const CircularProgressIndicator(),

            // Show error if any
            if (weatherState.errorMessage.isNotEmpty)
              Container(
                width: 375,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red[300]!),
                ),
                child: Text(weatherState.errorMessage),
              ),

            // Show weather data - accessing specific properties
            if (weatherState.weather != null)
              Container(
                width: 375,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[600]!, Colors.blue[800]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withValues(alpha: 0.3),
                      spreadRadius: 2,
                      blurRadius: 12,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      '${weatherState.weather!.cityName}, ${weatherState.weather!.countryName}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 177, 228, 247),
                      ),
                    ),
                    const SizedBox(height: 8),
                    //Weather Description
                    Text(
                      weatherState.weather!.condition.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 177, 228, 247),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Main Temp
                    Text(
                      '${weatherState.weather!.main.temp}°C',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 177, 228, 247),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Feels Like Temperature
                    Text(
                      'Feels Like ${weatherState.weather!.main.feelsLike}°C',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 177, 228, 247),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
// withValues(alpha: 0.3)