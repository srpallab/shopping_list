import 'package:flutter/material.dart';

import '../models/shopping_category.dart';

const categories = {
  ShoppingCategories.vegetables: ShoppingCategory(
    id: 1,
    name: 'Vegetables',
    color: Color.fromARGB(255, 0, 255, 128),
  ),
  ShoppingCategories.fruit: ShoppingCategory(
    id: 2,
    name: 'Fruit',
    color: Color.fromARGB(255, 145, 255, 0),
  ),
  ShoppingCategories.meat: ShoppingCategory(
    id: 3,
    name: 'Meat',
    color: Color.fromARGB(255, 255, 102, 0),
  ),
  ShoppingCategories.dairy: ShoppingCategory(
    id: 4,
    name: 'Dairy',
    color: Color.fromARGB(255, 0, 208, 255),
  ),
  ShoppingCategories.carbs: ShoppingCategory(
    id: 5,
    name: 'Carbs',
    color: Color.fromARGB(255, 0, 60, 255),
  ),
  ShoppingCategories.sweets: ShoppingCategory(
    id: 6,
    name: 'Sweets',
    color: Color.fromARGB(255, 255, 149, 0),
  ),
  ShoppingCategories.spices: ShoppingCategory(
    id: 7,
    name: 'Spices',
    color: Color.fromARGB(255, 255, 187, 0),
  ),
  ShoppingCategories.convenience: ShoppingCategory(
    id: 8,
    name: 'Convenience',
    color: Color.fromARGB(255, 191, 0, 255),
  ),
  ShoppingCategories.hygiene: ShoppingCategory(
    id: 9,
    name: 'Hygiene',
    color: Color.fromARGB(255, 149, 0, 255),
  ),
  ShoppingCategories.other: ShoppingCategory(
    id: 10,
    name: 'Other',
    color: Color.fromARGB(255, 0, 225, 255),
  ),
};
