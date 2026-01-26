import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Погода'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Отступ сверху
            SizedBox(height: 40),
            // Первый город
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/pictures/sun.png',
                  width: 80,
                  height: 80,
                ),
                SizedBox(width: 10),
                Text('Понедельник\n0 -11'),
              ],
            ),
            SizedBox(height: 20),
            // Второй день
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/pictures/snow.png',
                  width: 80,
                  height: 80,
                ),
                SizedBox(width: 10),
                Text('-11 -19\nВторник'),
              ],
            ),
            SizedBox(height: 20),
            // Среда
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/pictures/snow.png',
                  width: 80,
                  height: 80,
                ),
                SizedBox(width: 10),
                Text('-18 -23\nСреда'),
              ],
            ),
            SizedBox(height: 20),
            // Четверг
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/pictures/cloudy.png',
                  width: 80,
                  height: 80,
                ),
                SizedBox(width: 10),
                Text('-17 -25\nЧетверг'),
              ],
            ),
            SizedBox(height: 20),
            // Пятница
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/pictures/cloudy.png',
                  width: 80,
                  height: 80,
                ),
                SizedBox(width: 10),
                Text('-23 -30\nПятница'),
              ],
            ),
            SizedBox(height: 20),
            // Суббота
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/pictures/cloudy.png',
                  width: 80,
                  height: 80,
                ),
                SizedBox(width: 10),
                Text('-22 -30\nСуббота'),
              ],
            ),
            SizedBox(height: 20),
            // Воскресенье
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/pictures/cloud.png',
                  width: 80,
                  height: 80,
                ),
                SizedBox(width: 10),
                Text('-20 -26\nВоскресенье'),
              ],
            ),
            SizedBox(height: 40),
            // Кнопка
            ElevatedButton(
              onPressed: () {
                // Возврат на главную страницу
                Navigator.pop(context);
              },
              child: Text('Вернуться на главную'),
            ),
          ],
        ),
      ),
    );
  }
}
