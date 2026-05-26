import 'package:flutter/material.dart';
import 'services/network_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final NetworkService networkService = NetworkService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networking with HTTP'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            networkService.fetchTasks();
          },
          child: const Text('Fetch Tasks'),
        ),
      ),
    );
  }
}