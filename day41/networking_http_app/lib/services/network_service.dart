import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<void> fetchTasks() async {
    final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/todos',
    );

    try {
      final response = await http.get(url);

      print('Status Code: ${response.statusCode}');
      print('Headers: ${response.headers}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print('Response Body:');
        print(data);
      } else {
        print('Failed to fetch tasks');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}