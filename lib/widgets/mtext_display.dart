import 'package:flutter/material.dart';
import 'package:myshop/utilities/translation.dart';

class MTextDisplay extends StatelessWidget {
  final String translation;
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;

  MTextDisplay(
      {this.translation,
      this.textAlign = TextAlign.center,
      this.text,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      translation != null ? translate(context, translation) : text,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}
