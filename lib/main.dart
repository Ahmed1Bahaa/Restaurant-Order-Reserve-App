import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/cart_provider.dart';
import 'package:restaurant/home.dart';
import 'package:restaurant/root.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
