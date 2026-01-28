import 'package:flutter/material.dart';
import 'screens/weather_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Функция для получения погоды из Open-Meteo
Future<Map<String, dynamic>> fetchWeather() async {
  final response = await http.get(Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=47.7992&longitude=67.1475&current_weather=true'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
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
  late Future<Map<String, dynamic>> futureWeather;

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
        body: Column(
          children: [
            // Тут отображаем погоду
            FutureBuilder<Map<String, dynamic>>(
              future: futureWeather,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Ошибка: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  var weatherData = snapshot.data!;
                  if (weatherData.containsKey('current_weather')) {
                    var currentWeather = weatherData['current_weather'];
                    return Column(
                      children: [
                        Text('Температура: ${currentWeather['temperature']}°C'),
                        Text('Скорость ветра: ${currentWeather['windspeed']} км/ч'),
                        Text('Код погоды: ${currentWeather['weathercode']}'),
                      ],
                    );
                  } else {
                    return Text('Данные о текущей погоде недоступны');
                  }
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
    );
  }
}
