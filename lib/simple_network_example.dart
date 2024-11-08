import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleNetworkExample();
  }
}

class SimpleNetworkExample extends StatefulWidget {
  const SimpleNetworkExample({super.key});

  @override
  State<SimpleNetworkExample> createState() => _SimpleNetworkExampleState();
}

class _SimpleNetworkExampleState extends State<SimpleNetworkExample> {
  String data = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    const url = 'https://jsonplaceholder.typicode.com/todos/1';

    final response = await http.get(Uri.parse(url));

    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        data = response.body;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(data.isEmpty ? 'Loading...' : data),
        ),
      ),
    );
  }
}
