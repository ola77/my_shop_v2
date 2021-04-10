import 'package:flutter/material.dart';
import 'package:myshop/localization/AppLocalization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MText extends StatelessWidget {
  String text;
  String translation;
  Color color;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  TextDecoration decoration;
  int maxLines;

  TextOverflow overflow;

  MText(
      {this.text,
        this.fontSize = 18,
        this.translation,
        this.overflow=TextOverflow.ellipsis,
        this.decoration = TextDecoration.none,
        this.fontWeight = FontWeight.bold,
        this.maxLines,
        this.color,
        this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      translation != null
          ? AppLocalizations.of(context).translate(translation)
          : text ?? '',
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        decoration: decoration,
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
