import 'package:flutter/material.dart';
import 'package:kdemy/Theme/colors.dart';

class TextFieldForAuthScreens extends StatelessWidget {
  final String? hintText;
  final String? suffixText;
  final EdgeInsets? margin;
  final IconData? prefixIcon;
  final Color? color;
  final Function? onTap;

  TextFieldForAuthScreens(
      {this.hintText,
      this.suffixText,
      this.margin,
      this.prefixIcon,
      this.color,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 32, vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 1),
      decoration: BoxDecoration(
        color: color ?? textFieldColor,
        borderRadius: BorderRadius.circular(5),

      ),
      child: TextField(
        style: TextStyle(color: Colors.black),
        cursorColor: theme.primaryColor,
        onTap: onTap as void Function()?,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: theme.textTheme.subtitle2,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffix: Text(suffixText ?? ' '),
            suffixStyle: theme.textTheme.subtitle2!.copyWith(
              color: theme.primaryColor,
            ),

            focusColor: Colors.black),
      ),
    );
  }
}
