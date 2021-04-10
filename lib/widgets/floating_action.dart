import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myshop/res/colors.dart';
import 'package:myshop/res/images.dart';
class FloatingActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {},
        child: SvgPicture.asset(
          AppPics.Cart,
        ),
        backgroundColor: AppColors.secondColor);

  }
}
