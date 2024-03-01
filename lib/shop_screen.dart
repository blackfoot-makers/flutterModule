import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_epitech/cart_provider.dart';
import 'package:workshop_epitech/product_model.dart';

/// [ShopScreen] Screen to display shop with [Product] list and button to add [Product] to cart
class ShopScreen extends StatelessWidget {
  /// [ShopScreen] constructor
  const ShopScreen({
    required this.productList,
    super.key,
  });

  /// [List<Product>] productList use to display list of [Product]
  final List<Product> productList;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index) {
            final Product product = productList[index];
            final bool isInCart =
                context.watch<CartProvider>().cart.contains(product);
            return Card(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Text>[
                          Text(product.name),
                          Text(product.price),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: isInCart
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      if (isInCart) {
                        context.read<CartProvider>().removeFromCart(product);
                      } else {
                        context.read<CartProvider>().addToCart(product);
                      }
                    },
                    child: Text('${isInCart ? 'Remove from' : 'Add to'} cart'),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
