import 'package:flutter/material.dart';
import 'package:kdemy/Theme/colors.dart';

class LineContainer extends StatefulWidget {
  @override
  _LineContainerState createState() => _LineContainerState();
}

class _LineContainerState extends State<LineContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: double.infinity,
      color: textFieldColor,
    );
  }
}
