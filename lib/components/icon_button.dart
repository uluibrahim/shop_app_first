import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends IconButton {
  final VoidCallback press;
  final String path;
  final Color iconColor;
  CustomIconButton(
      {required this.press,
      required this.path,
      required this.iconColor,
      Key? key})
      : super(
          key: key,
          onPressed: press,
          icon: SvgPicture.asset(
            "assets/icons/$path.svg",
            color: iconColor,
          ),
        );
}
