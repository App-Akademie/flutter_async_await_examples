import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const ApiListExample());

class ApiListExample extends StatefulWidget {
  const ApiListExample({super.key});

  @override
  State<ApiListExample> createState() => _ApiListExampleState();
}

class _ApiListExampleState extends State<ApiListExample> {
  List<String> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        final productsJsonList = data['products'];
        for (final product in productsJsonList) {
          items.add(product["title"]);
        }
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('API List Example')),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(items[index]));
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(),
                  );
                },
              ),
      ),
    );
  }
}
