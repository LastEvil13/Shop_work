import 'package:flutter/material.dart';

class Cart {
  List<Map<String, dynamic>> items = [];

  void addItem(Map<String, dynamic> item) {
    items.add(item);
  }
}

class CartPage extends StatelessWidget {
  final Cart cart;

  CartPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            title: Text(item['Title']),
            subtitle: Text('${item['Cost']} руб.'),
          );
        },
      ),
    );
  }
}
