import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:workshops/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = <Product>[];

  UnmodifiableListView<Product> get cart =>
      UnmodifiableListView<Product>(_cart);

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
