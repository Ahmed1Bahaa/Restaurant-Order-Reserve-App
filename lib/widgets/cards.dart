import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/cart_provider.dart';





class MenuItemModel {
  final String image;
  final String text;
  final String desc;
  final String rate;
  final String price;

  MenuItemModel({
    required this.image,
    required this.text,
    required this.desc,
    required this.rate,
    required this.price
  });
}


List<MenuItemModel> menu = [
  MenuItemModel(
    image: "assets/beef.png",
    text: "Beef",
    desc: "Beef Burger",
    rate: "⭐ 4.9",
    price: "5"
  ),
  MenuItemModel(
    image: "assets/beef.png",
    text: "Chicken",
    desc: "Chicken Burger",
    rate: "⭐ 4.7",
    price: "3"
  ),
  MenuItemModel(
    image: "assets/beef.png",
    text: "Hamburger",
    desc: "Fried Chicken",
    rate: "⭐ 4.7",
      price: "10"
  ),
  MenuItemModel(
    image: "assets/beef.png",
    text: "Vegan",
    desc: "Veggie burger",
    rate: "⭐ 4.7",
      price: "8"
  ),
  MenuItemModel(
    image: "assets/beef.png",
    text: "Vegan",
    desc: "Veggie burger",
    rate: "⭐ 4.7",
      price: "3.5"
  ),
  MenuItemModel(
    image: "assets/beef.png",
    text: "Vegan",
    desc: "Veggie burger",
    rate: "⭐ 4.7",
      price: "7"
  ),

];


class MenuItemCard extends StatelessWidget {
  final MenuItemModel item;

  const MenuItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(item.image, width: 165),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.only(right: 145),
              child: Text(

                item.text,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 90),
              child: Text(item.desc, maxLines: 1, style: const TextStyle(fontSize: 14),),
            ),
            SizedBox(width: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 155, top: 1),
              child: GestureDetector(
                onTap: () {
                  context.read<CartProvider>().addItem(
                    CartItem(
                      name: item.text,
                      type: item.desc,
                      image: item.image,
                      price : item.price
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${item.text} added to cart"),
                      duration: const Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },


                child: CircleAvatar( radius: 11,

                  backgroundColor: Color(0xFF08431D),

                  child: Icon(
                    size: 20,
                    CupertinoIcons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:0),
              child: Row(
                children: [
                  Text(item.rate,maxLines: 1,style: const TextStyle(fontSize: 16)),
                  SizedBox(width: 40,),
                  Text(
                    "${item.price}\$",
                    maxLines: 1,
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
