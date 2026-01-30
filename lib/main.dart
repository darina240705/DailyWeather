import 'package:flutter/material.dart';
import 'screens/weather_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather {
  final double temperature;
  final double windSpeed;
  final double humidity;

  Weather({required this.temperature, required this.windSpeed, required this.humidity});

  factory Weather.fromJson(Map<String, dynamic> json) {
    final current = json['current'] ?? {};
    return Weather(
      temperature: current['temperature_2m'] ?? 0.0,
      windSpeed: current['wind_speed'] ?? 0.0,
      humidity: current['relative_humidity_2m'] ?? 0,
    );
  }
}

// Функция для получения погоды из Open-Meteo
Future<Weather> fetchWeather() async {
  final response = await http.get(Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=47.7992&longitude=67.1475&current=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation,wind_speed_10m,wind_direction_10m,wind_gusts_10m'));
    // https://api.open-meteo.com/v1/forecast?latitude=47.7992&longitude=67.1475&current_weather=true
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return Weather.fromJson(json);
  } else {
    throw Exception('Ошибка загрузки погоды');
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Погода в Караганде',
    home: Scaffold(
      appBar: AppBar(title: const Text('Погода в Караганде')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FutureBuilder<Weather>(
                future: futureWeather,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Ошибка: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final weather = snapshot.data!;
                    return Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Текущая погода',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text('Температура: ${weather.temperature}°C'),
                            Text('Ветер: ${weather.windSpeed} км/ч'),
                            Text('Влажность: ${weather.humidity}%'),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Text('Нет данных');
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherPage()),
                  );
                },
                child: const Text('Погода на неделю'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}
