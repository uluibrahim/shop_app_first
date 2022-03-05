import 'package:flutter/material.dart';
import 'package:flutter_shop/constants.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> _categories = [
    "Hand bag",
    "Jewellery",
    "Footwear",
    "Dresses"
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: ((context, index) => buildCategories(index)),
        ),
      ),
    );
  }

  Widget buildCategories(int index) => GestureDetector(
        onTap: (() {
          _selectedIndex = index;
          setState(() {});
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _categories[index],
                style: TextStyle(
                    color:
                        _selectedIndex == index ? kTextColor : kTextLigthColor,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 30,
                height: 2,
                margin: const EdgeInsets.only(top: kDefaultPadding / 4),
                color:
                    _selectedIndex == index ? Colors.black : Colors.transparent,
              )
            ],
          ),
        ),
      );
}
