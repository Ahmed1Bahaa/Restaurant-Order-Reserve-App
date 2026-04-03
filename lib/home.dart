import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/root.dart';
import 'package:restaurant/cart_provider.dart';

import 'menu.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {
  @override
  @override
  void initState() {
    super.initState();

    // Make sure context is ready before navigation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => root()),
          );
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF08431D),

      
      body: Column(children: [
        SizedBox(height: 300,),
        Center(
          child: Text("HUNGRY?",style: GoogleFonts.luckiestGuy(
            fontSize: 60,
            color: Colors.white,

          ),),

        ), SizedBox(height: 258,),
        Image.asset("assets/burger.png")


        
      ],)

    );
  }
}
