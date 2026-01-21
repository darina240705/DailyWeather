import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Погода'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [ 
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://via.placeholder.com/50', // замените на нужное изображение
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text('Текст рядом с изображением ${index + 1}'),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://via.placeholder.com/50', // замените на нужное изображение
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text('Текст рядом с изображением ${index + 1}'),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://via.placeholder.com/50', // замените на нужное изображение
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text('Текст рядом с изображением ${index + 1}'),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://via.placeholder.com/50', // замените на нужное изображение
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text('Текст рядом с изображением ${index + 1}'),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://via.placeholder.com/50', // замените на нужное изображение
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text('Текст рядом с изображением ${index + 1}'),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://via.placeholder.com/50', // замените на нужное изображение
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text('Текст рядом с изображением ${index + 1}'),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://via.placeholder.com/50', // замените на нужное изображение
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text('Текст рядом с изображением ${index + 1}'),
                    ],
                  ),
                ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Возврат на основную страницу
                  Navigator.pop(context);
                },
                child: Text('Вернуться на главную'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
