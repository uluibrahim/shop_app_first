import 'package:flutter/material.dart';
import 'package:flutter_shop/constants.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/screens/home/view/categories.dart';

import '../../../components/icon_button.dart';
import '../../detail/view/detail_page.dart';
import 'item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Categories(),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2.5),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: kDefaultPadding / 2.5,
                mainAxisSpacing: kDefaultPadding / 2.5,
              ),
              itemBuilder: (context, index) => ItemCard(
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage(
                            product: products[index],
                          )));
                },
                product: products[index],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: CustomIconButton(
        path: "back",
        press: () {},
        iconColor: kTextColor,
      ),
      actions: [
        CustomIconButton(
          path: "search",
          press: () {},
          iconColor: kTextColor,
        ),
        CustomIconButton(
          path: "cart",
          press: () {},
          iconColor: kTextColor,
        ),
        const SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
