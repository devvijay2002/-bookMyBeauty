import 'package:flutter/material.dart';

import '../../../constants/images.dart';

class addToCart extends StatefulWidget {
  const addToCart({super.key});

  @override
  State<addToCart> createState() => _addToCartState();
}

class _addToCartState extends State<addToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Color(0xFFF2F2F2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              cartImage,
              width: 157,
              height: 153,
            ),
            const SizedBox(height: 30,),
            Text("Your cart is empty",
            style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10,),
            Text("Looks like you have not added anything to our cart .\n Go ahead & explore top categories.",
            textAlign: TextAlign.center,)

          ],
        ),
      ),
    );
  }
}
