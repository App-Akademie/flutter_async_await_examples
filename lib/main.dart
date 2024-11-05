import 'package:flutter/material.dart';

import 'medium_dialog_example.dart';
import 'medium_image_picker_example.dart';
import 'medium_network_list_example.dart';
import 'simple_delay_example.dart';
import 'simple_network_example.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    SimpleNetworkExample(),
    SimpleDelayExample(),
    ApiListExample(),
    ImagePickerExample(),
    DialogExample(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Examples'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.network_check),
            label: 'Network',
          ),
          NavigationDestination(
            icon: Icon(Icons.timer),
            label: 'Delay',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'API List',
          ),
          NavigationDestination(
            icon: Icon(Icons.image),
            label: 'Image',
          ),
          NavigationDestination(
            icon: Icon(Icons.message),
            label: 'Dialog',
          ),
        ],
      ),
    );
  }
}
