import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Details'))),
      body: Column(
        children: [
          Text(
            product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          //spacer has a default flex value of 1
          const Spacer(),
          Image.asset(product['imageUrl'] as String),
        ],
      ),
    );
  }
}
