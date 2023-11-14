import '../models/grocery_item.dart';
import '../models/shopping_category.dart';
import 'shopping_categories.dart';

final groceryItems = [
  GroceryItem(
    id: 'a',
    name: 'Milk',
    quantity: 1,
    category: categories[ShoppingCategories.dairy]!,
  ),
  GroceryItem(
    id: 'b',
    name: 'Bananas',
    quantity: 5,
    category: categories[ShoppingCategories.fruit]!,
  ),
  GroceryItem(
    id: 'c',
    name: 'Beef Steak',
    quantity: 1,
    category: categories[ShoppingCategories.meat]!,
  ),
];
