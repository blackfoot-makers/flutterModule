import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_epitech/cart_provider.dart';
import 'package:workshop_epitech/int_extension.dart';

/// [ProfileScreen] Screen used to display user profile
class ProfileScreen extends StatelessWidget {
  /// [ProfileScreen] constructor
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int totalPoints = context.watch<CartProvider>().totalPoints;

    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('Total points: $totalPoints'),
              Text('Rank: ${totalPoints.toRank()}'),
            ],
          ),
          TextButton(
            onPressed: () => throw Exception(),
            child: const Text('Throw Test Exception'),
          ),
        ],
      ),
    );
  }
}
