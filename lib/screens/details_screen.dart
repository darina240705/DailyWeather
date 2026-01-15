import 'package:flutter/material.dart';

void main() {
  runApp(CoffeeApp());
}

class DetailsScreen extends Statelesswidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: const Text('Детали')),
      body: const Center(
        child: Text('Это второй экран приложения'),
      ),
    );
  }
}