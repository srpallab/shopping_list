import 'package:flutter/material.dart';

enum ShoppingCategories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other,
}

class ShoppingCategory {
  final int id;
  final String name;
  final Color color;

  const ShoppingCategory({
    required this.id,
    required this.name,
    required this.color,
  });
}
