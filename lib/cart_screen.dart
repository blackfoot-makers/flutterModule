import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshops/cart_provider.dart';
import 'package:workshops/product_model.dart';

class CartScreen extends StatelessWidget {
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
                subtitle: Text(product.price),
              );
            },
          );
        },
      ),
    );
  }
}
