import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var column = Column(
            children: <Row>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://www.pinterest.com/pin/636907572314201323/',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(width: 10),
                      Text('''
                            Понедельник
                            0 -11
                            '''),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://www.pinterest.com/pin/636907572314201323/',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text('''
                            Вторник
                            -11 -19
                            '''),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://www.pinterest.com/pin/636907572314201323/',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text('''
                          Среда
                          -18 -23
                          '''),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://www.pinterest.com/pin/636907572314201323/',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text('''
                          Четверг
                          -17 -25
                          '''),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://www.pinterest.com/pin/636907572314201323/',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text('''
                          Пятница
                          -23 -30
                          '''),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://www.pinterest.com/pin/636907572314201323/',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text('''
                          Суббота
                          -22 -30
                          '''),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://www.pinterest.com/pin/636907572314201323/',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text('''
                          Воскресенье
                          -20 -26
                          '''),
                    ],
                  ),
            ],
            children: <SizedBox> [
              SizedBox(height: 40),
              ],
            children: <ElevatedButton> [
              ElevatedButton(
                onPressed: () {
                  // Возврат на основную страницу
                  Navigator.pop(context);
                },
                child: Text('Вернуться на главную'),
              ),
              ],
          );
    return Scaffold(
      appBar: AppBar(
        title: Text('Погода'),
      ),
      body: SingleChildScrollView(
        child: column,
      ),
    );
  }
}
