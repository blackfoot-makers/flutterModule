import 'package:flutter/material.dart';

/// [ProfileScreen] Screen used to display user profile
class ProfileScreen extends StatelessWidget {
  /// [ProfileScreen] constructor
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: TextButton(
          onPressed: () => throw Exception(),
          child: const Text('Throw Test Exception'),
        ),
      );
}
