import 'package:flutter/material.dart';
import 'Home_Screen.dart';
import 'LoginScreen.dart';
import 'RegisterScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

void main() {
  WidgetFlutterService.ensureInitialized();
  await NotificationService().initilize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter WeatherApp',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Вы вошли.',
          style: TextStyle(fontSize: 18, marginBottom: 20),
        ),
        ElevatedButton: (
          onPressed: () {
            NotificationService().showNotification(
              title: "Hello",
              body: "This is your notification message",
            );
          },
          child: Text('Нажмите на кнопку.'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: const Text('Перейти в приложение'),
        ),
      ],
    );
  }
}