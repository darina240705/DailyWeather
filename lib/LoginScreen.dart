import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<Map<String, String>> _getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString('users');
    if (usersJson == null) return {};
    return Map<String, String>.from(json.decode(usersJson));
  }

  Future<void> _login() async {
    final login = _loginController.text.trim();
    final password = _passwordController.text;

    if (login.isEmpty || password.isEmpty) {
      _showMessage('Пожалуйста, заполните все поля');
      return;
    }

    final users = await _getUsers();

    if (!users.containsKey(login)) {
      _showMessage('Неверный логин или пароль');
      return;
    }

    // Захэшировать введённый пароль
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    final hashPassword = digest.toString();

    if (users[login] == hashPassword) {
      // Успешный вход
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      _showMessage('Неверный логин или пароль');
    }
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Вход")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _loginController,
              decoration: InputDecoration(labelText: 'Логин'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Пароль'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Войти'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/register'),
              child: Text('Регистрация'),
            ),
          ],
        ),
      ),
    );
  }
}