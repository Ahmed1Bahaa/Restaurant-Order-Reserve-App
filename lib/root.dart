import 'package:flutter/material.dart';
import 'package:restaurant/cart.dart';
import 'package:restaurant/home.dart';
import 'package:restaurant/menu.dart';
import 'package:restaurant/product_view.dart';
import 'package:restaurant/cart_provider.dart';

import 'Table_reservation.dart';
class root extends StatefulWidget {
  root({super.key});

  @override
  State<root> createState() => _rootState();
}

class _rootState extends State<root> {
  late PageController controller;
  late List<Widget> screens;
  int currentpage = 0;

  @override
  void initState() {
    super.initState();

    screens = [

      menu(),
      Cart(),
      TableReservation(),
    ];

    controller = PageController(initialPage: currentpage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: screens,
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF08431D),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        currentIndex: currentpage,

        onTap: (index) {
          setState(() => currentpage = index);
          controller.jumpToPage(index);
        },

        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "cart"),
          BottomNavigationBarItem(icon: Icon(Icons.table_restaurant), label: "reserve"),
        ],
      ),
    );
  }
}
