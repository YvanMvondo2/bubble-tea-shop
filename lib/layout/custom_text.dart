// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  int? maxLines;
  TextOverflow overFlow;
  final TextAlign? align;
  final FontWeight? fontWeight;

  CustomText({
    Key? key,
    this.color = Colors.black54,
    required this.text,
    this.size = 16,
    this.height = 1.2,
    this.maxLines = 10,
    this.overFlow = TextOverflow.ellipsis,
    this.align,
    this.fontWeight = FontWeight.bold

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overFlow,
      style: TextStyle(
          color: color,
          letterSpacing: 1.0,
          fontSize: size,
          height: height,
          fontWeight: fontWeight
      ),
    );
  }
}