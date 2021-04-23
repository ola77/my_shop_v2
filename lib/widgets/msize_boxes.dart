import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class MHeight extends StatelessWidget {
  final double height;

  MHeight({this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}

class MWidth extends StatelessWidget {
  final double width;
  MWidth({this.width});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
    );
  }
}
