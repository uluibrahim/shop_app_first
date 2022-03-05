import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/product.dart';

class ItemCard extends GestureDetector {
  final Product product;
  final VoidCallback press;

  ItemCard({Key? key, required this.product, required this.press})
      : super(
            key: key,
            onTap: press,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                      color: product.color,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Hero(
                        tag: "${product.id}",
                        child: Image.asset(product.image)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
                  child: Text(
                    product.title,
                    style: const TextStyle(color: kTextLigthColor),
                  ),
                ),
                Text(
                  "\$${product.price}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ));
}
