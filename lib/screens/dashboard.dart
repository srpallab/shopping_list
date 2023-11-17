import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/data/shopping_categories.dart';

import '../models/grocery_item.dart';
import 'new_item.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<GroceryItem> groceryData = [];
  late Future<List<GroceryItem>> loadedItems;

  @override
  void initState() {
    super.initState();
    loadedItems = loadItem();
  }

  Future<List<GroceryItem>> loadItem() async {
    final url = Uri.https(
      'srp-shopping-list-default-rtdb.asia-southeast1.firebasedatabase.app',
      'shopping-list.json',
    );

    final response = await http.get(url);
    if (response.statusCode >= 400) {
      throw Exception('Server Error. Try Again.');
    } else if (response.body == 'null') {
      return [];
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadData = [];

    for (final item in listData.entries) {
      final category = categories.entries.firstWhere(
        (catItem) => catItem.value.name == item.value['category'],
      );
      loadData.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category.value,
        ),
      );
    }
    return loadData;
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => const NewItem()),
    );
    if (newItem == null) return;
    setState(() {
      groceryData.add(newItem);
    });
  }

  // Future<void> _removeItem(GroceryItem item) async {
  //   final index = groceryData.indexOf(item);
  //   setState(() {
  //     groceryData.remove(item);
  //   });
  //
  //   final url = Uri.https(
  //     'srp-shopping-list-default-rtdb.asia-southeast1.firebasedatabase.app',
  //     'shopping-list/${item.id}.json',
  //   );
  //   final response = await http.delete(url);
  //   if (response.statusCode >= 400) {
  //     groceryData.insert(index, item);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: FutureBuilder(
        future: loadedItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.data!.isEmpty) {
            return const Center(child: Text("No Item Added Yet."));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: Container(
                  height: 20,
                  width: 20,
                  color: snapshot.data![index].category.color,
                ),
                title: Text(
                  snapshot.data![index].name,
                  style: const TextStyle(fontSize: 15),
                ),
                trailing: Text(
                  snapshot.data![index].quantity.toString(),
                  style: const TextStyle(fontSize: 15),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
