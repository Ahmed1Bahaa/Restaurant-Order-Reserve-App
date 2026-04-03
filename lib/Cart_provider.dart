import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String type;
  final String image;
  final String price;
  int qty;

  CartItem({
    required this.name,
    required this.type,
    required this.image,
    required this.price,
    this.qty = 1,
  });
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addItem(CartItem item) {
    final index = _items.indexWhere((x) => x.name == item.name);
    if (index != -1) {
      _items[index].qty++;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void increment(int index) {
    _items[index].qty++;
    notifyListeners();
  }

  void decrement(int index) {
    if (_items[index].qty > 1) {
      _items[index].qty--;
    } else {
      _items.removeAt(index);
    }
    notifyListeners();
  }

  void removeAt(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
  void clear() {
    _items.clear();
    notifyListeners();
  }

}

