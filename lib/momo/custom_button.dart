import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    Key? key,
    this.width,
    required this.onClicked,
  }) : super(key: key);

  double? width;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/images/button.png')],
        ),
      ),
    );
  }
}
