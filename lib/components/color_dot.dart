import 'package:flutter/material.dart';

import '../constants.dart';

class ColorDot extends Container {
  final Color circleColor;
  final bool isSelected;

  ColorDot({Key? key, required this.circleColor, this.isSelected = false})
      : super(
          key: key,
          margin: const EdgeInsets.only(
            top: kDefaultPadding / 4,
            right: kDefaultPadding / 2,
          ),
          padding: const EdgeInsets.all(2.5),
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: isSelected ? circleColor : Colors.transparent),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: circleColor,
            ),
          ),
        );
}
