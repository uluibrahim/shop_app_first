import 'package:flutter/material.dart';

import '../../../components/color_dot.dart';
import '../../../constants.dart';
import '../../../models/product.dart';

class ColorAndSize extends Row {
  final BuildContext context;
  final Product product;
  ColorAndSize({Key? key, required this.product, required this.context})
      : super(
          key: key,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Color"),
                  Row(
                    children: [
                      ColorDot(
                        circleColor: const Color(0xFF356C95),
                        isSelected: true,
                      ),
                      ColorDot(circleColor: const Color(0xFFF8C078)),
                      ColorDot(circleColor: const Color(0xFFA29B9B))
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: kTextColor),
                  children: [
                    const TextSpan(text: "Size\n"),
                    TextSpan(
                        text: "${product.size} cm",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            )
          ],
        );
}
