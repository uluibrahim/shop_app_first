import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/screens/detail/view/cart_counter.dart';
import 'package:flutter_shop/screens/detail/view/color_and_size.dart';
import 'package:flutter_shop/screens/detail/view/product_image_with_title.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/icon_button.dart';
import '../../../constants.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppbar(context),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: _size.height,
              child: Stack(children: [
                Container(
                  margin: EdgeInsets.only(top: _size.height * 0.35),
                  padding: EdgeInsets.only(
                    top: _size.height * 0.12,
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  height: _size.height * 0.65,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      ColorAndSize(product: product, context: context),
                      buildDescription,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [const CartCounter(), buildFavIcon],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 30),
                              height: 35,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(color: product.color)),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      "assets/icons/add_to_cart.svg")),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(product.color),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Buy Now",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ProductImageWithTitle(product: product, size: _size)
              ]),
            )
          ],
        )),
      ),
    );
  }

  Container get buildFavIcon => Container(
        height: 32,
        width: 32,
        decoration: const BoxDecoration(
          color: Color(0xFFFF6464),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          "assets/icons/heart.svg",
          fit: BoxFit.scaleDown,
        ),
      );

  Padding get buildDescription => Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Text(
          product.description,
          style: const TextStyle(height: 1.5),
        ),
      );

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: CustomIconButton(
        path: "back",
        press: () {
          Navigator.pop(context);
        },
        iconColor: Colors.white,
      ),
      actions: [
        CustomIconButton(
          path: "search",
          press: () {},
          iconColor: Colors.white,
        ),
        CustomIconButton(
          path: "cart",
          press: () {},
          iconColor: Colors.white,
        ),
        const SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
