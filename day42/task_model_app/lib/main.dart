import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Model App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaskScreen(),
    );
  }
}

class TaskModel {
  final int id;
  final String title;
  final bool completed;

  TaskModel({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<TaskModel> tasks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      setState(() {
        tasks = data.map((json) => TaskModel.fromJson(json)).toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Model App'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];

                return ListTile(
                  leading: CircleAvatar(
                    child: Text(task.id.toString()),
                  ),
                  title: Text(task.title),
                  trailing: Icon(
                    task.completed
                        ? Icons.check_circle
                        : Icons.cancel,
                    color: task.completed
                        ? Colors.green
                        : Colors.red,
                  ),
                );
              },
            ),
    );
  }
}