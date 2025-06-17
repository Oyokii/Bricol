import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    const itemsTotal = 0;

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 20,),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_return_sharp)),
                  SizedBox(width: screenWidth*0.7,),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
                ],
              ),
              const Text("Shopping Cart", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  const SizedBox(width: 20,),
                  Text("$itemsTotal items"),
                  SizedBox(width: screenWidth*0.6,),
                  const Text("Tout supprimer", style: TextStyle(decoration: TextDecoration.underline)),
                ],
              ),
              const Divider(height: 40, color: Colors.black, thickness: 3, indent: 30, endIndent: 30),

            ],
          ),
        ),)
      ),
    );
  }
}
