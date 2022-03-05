import 'package:flutter/material.dart';
import 'package:flutter_shop/constants.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  State<CartCounter> createState() => CartCounterState();
}

class CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlinedButton(
            iconData: Icons.remove,
            press: () {
              if (numOfItems > 1) {
                numOfItems--;
                setState(() {});
              }
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlinedButton(
            iconData: Icons.add,
            press: () {
              numOfItems++;
              setState(() {});
            }),
      ],
    );
  }

  SizedBox buildOutlinedButton(
          {required IconData iconData, required VoidCallback press}) =>
      SizedBox(
        width: 40,
        child: OutlinedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          onPressed: press,
          child: Icon(iconData),
        ),
      );
}
