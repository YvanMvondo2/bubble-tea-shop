import 'package:flutter/material.dart';

import '../momo/colors.dart';

enum BInputType { phone, text, number }

class BInputField extends StatelessWidget {
  final ValueChanged onSelected;
  final VoidCallback? onTap;
  final String? label;
  final String? hintText;
  final Widget? prefixIcon;
  final BInputType type;
  final bool disable;
  final Widget? suffixIcon;
  final bool filled;
  final Color? fillColor;
  final String? labelText;
  final double? height;
  final double? borderRadius;
  final TextEditingController? controller;

  final EdgeInsetsGeometry? contentPadding;

  const BInputField({
    required this.onSelected,
    this.label,
    this.type = BInputType.text,
    this.disable = false,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.onTap,
    this.suffixIcon,
    this.filled = true,
    this.fillColor,
    Key? key,
    this.height,
    this.borderRadius,
    this.contentPadding,
    this.labelText,
  })  : assert((type == BInputType.phone) || type != BInputType.phone),
        super(key: key);

  TextInputType get inputType {
    switch (type) {
      case BInputType.phone:
        return const TextInputType.numberWithOptions(
            decimal: false, signed: false);
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                label!,
                style: const TextStyle(color: MomoColors.uiColor,),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: onTap,
                  child: SizedBox(
                    height: height ?? 45,
                    child: TextFormField(
                        controller: controller,
                        keyboardType: inputType,
                        textAlignVertical: TextAlignVertical.top,
                        enabled: true,
                        readOnly: false,
                        cursorColor: Colors.black,
                        enableInteractiveSelection: true,
                        autofocus: false,
                        cursorHeight: 18,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            prefixIcon: prefixIcon,
                            suffixIcon: suffixIcon,
                            contentPadding: contentPadding,
                            prefixIconColor: Colors.black,
                            fillColor: MomoColors.uiColor,
                            focusColor: Colors.black,
                            filled: filled,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: MomoColors.uiColor,
                                    width: 1),
                                borderRadius:
                                    BorderRadius.circular(borderRadius ?? 5)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: MomoColors.primaryBackground,
                                    width: 2),
                                borderRadius:
                                    BorderRadius.circular(borderRadius ?? 5)),
                            hintText: hintText,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ))),
                  ),
                ),
              )
            ],
          ),
        ],
      );
    });
  }
}
