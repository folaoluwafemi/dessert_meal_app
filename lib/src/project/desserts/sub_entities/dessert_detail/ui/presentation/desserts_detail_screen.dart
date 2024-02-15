import 'package:flutter/material.dart';

class DessertDetailScreen extends StatelessWidget {
  final String dessertID;

  const DessertDetailScreen({
    Key? key,
    required this.dessertID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Placeholder(),
    );
  }
}
