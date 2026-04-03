import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/cart_provider.dart';
import 'package:restaurant/cart_provider.dart';


class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const Gap(20),

                // Empty cart
                if (cart.items.isEmpty)
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Cart is empty",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final cartItem = cart.items[index];

                        return Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(cartItem.image, width: 120),
                                    Text(
                                      cartItem.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(cartItem.type),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () => cart.increment(index),
                                          child: const CircleAvatar(
                                            backgroundColor: Color(0xFF08431D),
                                            child: Icon(
                                              CupertinoIcons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const Gap(20),
                                        Text("${cartItem.qty}"),
                                        const Gap(20),
                                        GestureDetector(
                                          onTap: () => cart.decrement(index),
                                          child: const CircleAvatar(
                                            backgroundColor: Color(0xFF08431D),
                                            child: Icon(
                                              CupertinoIcons.minus,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: () => cart.removeAt(index),
                                      child: Container(
                                        height: 45,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: const Color(0xFF08431D),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Remove",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),



                Padding(
                  padding: const EdgeInsets.only(left: 255, bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      final cartProvider = context.read<CartProvider>();

                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (dialogContext) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            title: const Text("Order Placed 🎉"),
                            content: const Text("Your order has been placed successfully."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context.read<CartProvider>().clear(); // clear cart
                                  Navigator.pop(dialogContext);  // close dialog
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    },


                    child: Container( height: 45, width: 130,
                        decoration: BoxDecoration(color: Color(0xFF08431D), borderRadius: BorderRadius.circular(15)),
                        child: Center(child: Text("Checkout", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
