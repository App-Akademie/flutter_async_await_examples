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
  List<String> productTitles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    const uriString = 'https://dummyjson.com/products';
    final response = await http.get(Uri.parse(uriString));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        final productsJsonList = data['products'];
        for (final product in productsJsonList) {
          productTitles.add(product["title"]);
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('API List Example')),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: productTitles.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(productTitles[index]));
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
