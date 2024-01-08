import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

void main() => runApp(const WebSocketExample());

class WebSocketExample extends StatefulWidget {
  const WebSocketExample({super.key});

  @override
  State<WebSocketExample> createState() => _WebSocketExampleState();
}

class _WebSocketExampleState extends State<WebSocketExample> {
  final channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  String _message = 'No Data';

  @override
  void initState() {
    super.initState();
    channel.stream.listen((data) {
      setState(() {
        _message = data.toString();
      });
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('WebSocket Example')),
        body: Center(child: Text(_message)),
      ),
    );
  }
}
