import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/widgets/cards.dart' as data;
import 'package:restaurant/cart_provider.dart';


class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, right: 140),
              child: Text(
                "HUNGRY?",
                style: GoogleFonts.luckiestGuy(
                  fontSize: 60,
                  color: Color(0xFF08431D),
                ),
              ),
            ),
            SizedBox(height: 33),
            Container(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 2,
                  crossAxisSpacing: 2
              ),
                itemCount: data.menu.length,
                itemBuilder: (context, index) {
                  return data.MenuItemCard(item: data.menu[index]);
                }
            ),
          ],
        ),
      ),
    );
  }
}


