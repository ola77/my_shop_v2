import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

import 'mnetwork_image.dart';

class MRoundCornerNetworkImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final BoxFit boxFit;

  MRoundCornerNetworkImage(
      {this.imagePath, this.width, this.height, this.boxFit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.w),
      child: MNetworkImage(
        imagePath: imagePath,
        boxFit: boxFit,
        width: width,
        height: height,
      ),
    );
  }
}
