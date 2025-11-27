import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color.fromRGBO(216, 240, 253, 1),
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(16),
      //Move colour inside box decoration, so there wont be an error, if there is no box decoration property, you can leave colour inside container
      decoration: BoxDecoration(
        //color: Color.fromRGBO(216, 240, 253, 1),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //use theme.ofcontext to take the global style you set under themeData
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 5),
          Text('\$$price', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 5),
          //Image(image: AssetImage(image)),
          //Wrap image with a Center widget so it can be aligned to the center
          Center(child: Image.asset(image, height: 175)),
        ],
      ),
    );
  }
}
