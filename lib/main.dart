import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshops/cart_provider.dart';
import 'package:workshops/product_model.dart';
import 'package:workshops/profile_screen.dart';
import 'package:workshops/shop_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
          child: const ScreenLayout(),
        ),
      );
}

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  int _selectedIndex = 0;
  late List<Product> _productList;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _productList = List<Product>.generate(
      50,
      (int index) => Product(
        image: 'https://picsum.photos/id/$index/300/150',
        name: 'Product $index',
        price: '${index.toStringAsFixed(2)} \$',
      ),
    );

    _screens = <Widget>[
      ShopScreen(
        productList: _productList,
      ),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('MyShop'),
          leading: UnconstrainedBox(
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.amber.shade800,
              child: Text(context.watch<CartProvider>().cart.length.toString()),
            ),
          ),
        ),
        body: _screens.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      );
}
