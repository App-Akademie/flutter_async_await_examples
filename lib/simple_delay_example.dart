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

  // Wie sage ich, dass eine Funktion gleichzeitig laufen kann?
  //
  // 1. async an die Funktion.
  // 2. Returnwert auf: Future<...> oder void.
  // 3. Dann kann in der Funktion await verwendet werden.
  //
  // In der async Funktion kann nun etwas mit dem Wert gemacht werden.
  Future<void> createDelay() async {
    // In DIESER Funktion warten auf das Ergebnis hinter dem await.
    final delayFuture = Future.delayed(const Duration(seconds: 3));
    await delayFuture;
    setState(() {
      message = 'Delay completed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: Text(message))));
  }
}
