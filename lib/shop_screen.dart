import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshops/cart_provider.dart';
import 'package:workshops/cart_screen.dart';
import 'package:workshops/product_model.dart';

final List<Product> _productList = List<Product>.generate(
  50,
  (int index) => Product(
    image: 'https://picsum.photos/id/$index/300/150',
    name: 'Product $index',
    price: '${index.toStringAsFixed(2)} €',
  ),
);

class ShopScreen extends StatelessWidget {
  const ShopScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: _productList.length,
          itemBuilder: (BuildContext context, int index) {
            final Product product = _productList[index];
            final bool isInCart =
                context.watch<CartProvider>().cart.contains(product);
            return Card(
              key: Key(product.image),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: 'product${product.name}',
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    ),
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
                  _ButtonAnimated(
                    isInCart: isInCart,
                    product: product,
                    beginColor: Theme.of(context).colorScheme.primary,
                    endColor: Theme.of(context).colorScheme.error,
                  ),
                ],
              ),
            );
          },
        ),
      );
}

class _ButtonAnimated extends StatefulWidget {
  const _ButtonAnimated({
    required this.isInCart,
    required this.product,
    required this.beginColor,
    required this.endColor,
  });

  final bool isInCart;
  final Product product;
  final Color beginColor;
  final Color endColor;

  @override
  State<_ButtonAnimated> createState() => _ButtonAnimatedState();
}

class _ButtonAnimatedState extends State<_ButtonAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              unawaited(
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const CartScreen(),
                  ),
                ),
              );
            }
          })
          ..addListener(() {});
    _colorAnimation = ColorTween(
      begin: widget.isInCart ? widget.endColor : widget.beginColor,
      end: widget.isInCart ? widget.beginColor : widget.endColor,
    ).animate(_controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
  }

  void _onPress() {
    if (widget.isInCart) {
      context.read<CartProvider>().removeFromCart(widget.product);
      _controller.reverse();
    } else {
      context.read<CartProvider>().addToCart(widget.product);
      _controller.forward();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _controller.value * 2 * pi,
      child: TextButton(
        key: Key(widget.product.name),
        style: TextButton.styleFrom(
          foregroundColor: _colorAnimation.value,
        ),
        onPressed: _onPress,
        child: Text('${widget.isInCart ? 'Remove from' : 'Add to'} cart'),
      ),
    );
  }
}
