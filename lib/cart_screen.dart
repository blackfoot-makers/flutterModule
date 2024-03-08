import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_epitech/cart_provider.dart';
import 'package:workshop_epitech/product_model.dart';

/// [CartScreen] Screen to display cart data
class CartScreen extends StatelessWidget {
  /// constructor
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Consumer<CartProvider>(
        builder: (BuildContext context, CartProvider cartProvider, _) {
          return ListView.builder(
            itemCount: cartProvider.cart.length,
            itemBuilder: (BuildContext context, int index) {
              final Product product = cartProvider.cart[index];
              return ListTile(
                leading: Hero(
                  tag: 'product${product.name}',
                  child: Image.network(product.image),
                ),
                title: Text(product.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(product.price),
                    Text('Points: ${product.points}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
