import 'package:flutter/material.dart';
import 'screens/weather_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Переход между страницами',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главная страница'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Караганда'),
            Text('Сегодня'),
            Image.network(
             'https://www.pinterest.com/pin/636907572314201323/',
              width: 150,
              height: 150,
            ),
            Text('''Температура: -15
                 Влажность: 71%
                 Ветер: 8 км/ч'''),
            Text('Рекомендации по погоде'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherPage()),
                );
              },
              child: Text('Погода на неделю'),
            ),
          ],
        ),
      ),
    );
  }
}
