import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/home_page.dart';
import 'package:shop_app_flutter/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //set overall app font here
      theme: ThemeData(
        fontFamily: 'inter',
        //set colour scheme here
        //this helps generate a light theme
        //colorScheme: ColorScheme.light(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1),
        ),
        //define appbar themestyle here
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
        ),
        //define input decoration theme here
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //titleSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        //use material3 = true so app bar can be transparent
        useMaterial3: true,
      ),

      title: 'Shopping App',

      home: ProductDetailsPage(product: products[0]),
    );
  }
}
