import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:workshop_epitech/product_model.dart';

///
/// [CartProvider]
/// Use to manage all shopping cart data
///
class CartProvider extends ChangeNotifier {
  final List<Product> _cart = <Product>[];

  /// [UnmodifiableListView<Product>] Getter to get cart data without the possibility to change it
  UnmodifiableListView<Product> get cart =>
      UnmodifiableListView<Product>(_cart);

  /// Get total points from all products in the cart
  int get totalPoints => _cart.fold<int>(
        0,
        (int previousValue, Product element) => previousValue + element.points,
      );

  /// Add [Product] to cart and notify the listeners
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  /// Add [Product] from cart and notify the listeners
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
