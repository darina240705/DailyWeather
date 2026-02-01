import 'package:flutter/material.dart';
import 'screens/weather_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather {
  final double temperature;
  final double windSpeed;
  final double humidity;
  final double apparentTemperature;
  final double precipitation;
  final double windDirection;
  final double windGusts;

  Weather({required this.temperature, required this.windSpeed, required this.humidity, required this.apparentTemperature, required this.precipitation, required this.windDirection, required this.windGusts});

  factory Weather.fromJson(Map<String, dynamic> json) {
    final current = json['current'] ?? {};
    return Weather(
      temperature: current['temperature_2m'] ?? 0.0,
      apparentTemperature: current['apparent_temperature'] ?? 0.0,
      windSpeed: current['wind_speed'] ?? 0.0,
      humidity: current['relative_humidity_2m'] ?? 0,
      precipitation: current['precipitation'] ?? 0.0,
      windDirection: current['wind_direction_10m'] ?? 0.0,
      windGusts: current['wind_gusts_10m'] ?? 0.0,
    );
  }
}

// Функция для получения погоды из Open-Meteo
Future<Weather> fetchWeather() async {
  final response = await http.get(Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=47.7992&longitude=67.1475&current=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation,wind_speed_10m,wind_direction_10m,wind_gusts_10m,weather_code'));
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
      backgroundColor: Color(0xFFC4B1C1),
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
                      color: Color(0xFFB78FB1),
                      elevation: 4,
                      child: DefaultTextStyle(
                        style:TextStyle(color: Color(0xFF3D1E3F)),
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
                                SizedBox(height: 5),
                                Text('Ощущается как: ${weather.apparentTemperature}°C'),
                                SizedBox(height: 5),
                                Text('Ветер: ${weather.windSpeed} км/ч'),
                                SizedBox(height: 5),
                                Text('Направление ветра: ${weather.windDirection}°'),
                                SizedBox(height: 5),
                                Text('Порывы ветра: ${weather.windGusts} км/ч'),
                                SizedBox(height: 5),
                                Text('Влажность: ${weather.humidity}%'),
                                SizedBox(height: 5),
                                Text('Осадки: ${weather.precipitation} мм'),
                              ],
                            ),
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