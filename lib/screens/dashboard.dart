import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Groceries")),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: Container(
              height: 20,
              width: 20,
              color: groceryItems[index].category.color,
            ),
            title: Text(
              groceryItems[index].name,
              style: const TextStyle(fontSize: 15),
            ),
            trailing: Text(
              groceryItems[index].quantity.toString(),
              style: const TextStyle(fontSize: 15),
            ),
          );
        },
      ),
    );
  }
}
