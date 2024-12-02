import 'package:flutter/material.dart';

import '../model/cart_model.dart';
class CartNotifier extends ValueNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(CartItem item) {
    value = [...value, item];
    notifyListeners();
  }

  void updateItem(CartItem updatedItem) {
    int index = value.indexWhere((item) => item.name == updatedItem.name);
    if (index != -1) {
      value[index] = updatedItem;
      notifyListeners();
    }
  }

  void removeItem(CartItem item) {
    value = value.where((cartItem) => cartItem.name != item.name).toList();
    notifyListeners();
  }
}
