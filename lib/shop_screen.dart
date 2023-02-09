import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshops/cart_provider.dart';
import 'package:workshops/product_model.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({
    required this.productList,
    super.key,
  });

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
