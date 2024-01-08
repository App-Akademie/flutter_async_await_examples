import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleDelayExample();
  }
}

class SimpleDelayExample extends StatefulWidget {
  const SimpleDelayExample({super.key});

  @override
  State<SimpleDelayExample> createState() => _SimpleDelayExampleState();
}

class _SimpleDelayExampleState extends State<SimpleDelayExample> {
  String message = 'Loading...';

  @override
  void initState() {
    super.initState();
    createDelay();
  }

  Future<void> createDelay() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      message = 'Delay completed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: Text(message))));
  }
}
