// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  IconData? icon;
  Color? backgroundColor;
  Color? iconColor;
  final double size;
  final double iconSize;
  double? fontSize;
  Widget? image;
  String? title;
  final VoidCallback? onPressed;
  CustomIcon(
      {Key? key,
      this.icon,
      this.backgroundColor = Colors.black,
      this.iconColor = const Color(0xff756d54),
      this.size = 40,
      this.onPressed,
      this.title,
      this.fontSize = 12,
      this.image,
      this.iconSize = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.transparent),
          child: InkWell(
            //splashColor: Colors.white,
            onTap: onPressed,
            child: image ??
                Icon(
                  icon,
                  color: backgroundColor,
                  size: iconSize,
                ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title!,
          style: TextStyle(color: backgroundColor, fontSize: fontSize),
        )
      ],
    );
  }
}
