import 'package:flutter/material.dart';
class MButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Widget child;
  final EdgeInsetsGeometry margin;

  const MButton({
    this.margin,
    this.width,
    this.height,
    this.color,
    this.textColor,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
        width:width,
        height: height,
        child: Center(child:child,),
        decoration: BoxDecoration(
       color: color,
        ),
    );
  }
}
