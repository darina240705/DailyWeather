import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<bool> _isLoginExists(String login) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString('users');
    if (usersJson == null) return false;

    Map<String, String> users = Map<String, String>.from(json.decode(usersJson));
    return users.containsKey(login);
  }

  Future<void> _register() async {
    final login = _loginController.text.trim();
    final password = _passwordController.text;

    if (login.isEmpty || password.isEmpty) {
      _showMessage('Пожалуйста, заполните все поля');
      return;
    }

    if (await _isLoginExists(login)) {
      _showMessage('Логин уже существует');
      return;
    }

    // Хэшировать пароль
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    final hashPassword = digest.toString();

    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString('users');
    Map<String, String> users = {};

    if (usersJson != null) {
      users = Map<String, String>.from(json.decode(usersJson));
    }

    users[login] = hashPassword;
    await prefs.setString('users', json.encode(users));

    _showMessage('Регистрация успешна');
    Navigator.of(context).pop(); // возврат назад (или перейти на логин)
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Регистрация")),
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
              onPressed: _register,
              child: Text('Зарегистрироваться'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Вернуться к входу'),
            )
          ],
        ),
      ),
    );
  }
}