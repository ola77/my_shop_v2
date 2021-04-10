import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MImage extends StatelessWidget {
  String image;
  double width, height;
  BoxFit boxFit;
  double round;
  bool fromFile;

  bool isProfile;

  MImage(
      {this.image,
      this.width,
      this.round,
      this.height,
      this.fromFile = false,
      this.boxFit = BoxFit.none,
      this.isProfile = true});

  @override
  Widget build(BuildContext context) {
    if (image == null) return errorImage();
    if (round != null)
      return ClipRRect(
        borderRadius: BorderRadius.circular(round),
        child: buildImage(),
      );
    return ClipOval(
      child: fromFile ? imageFile() : buildImage(),
    );
  }

  Image buildImage() {
    if (fromFile) {
      return errorImage();
    }
    return Image.network(
      image,
      width: width,
      height: height,
      fit: boxFit,
      errorBuilder: (
        BuildContext context,
        Object error,
        StackTrace stackTrace,
      ) {
        return errorImage();
      },
    );
  }

  Widget imageFile() {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
//        color: gray,
          borderRadius: BorderRadius.circular(width / 2)),
      child: Image.file(
        File(image),
        width: width,
        height: height,
        fit: boxFit,
      ),
    );
  }

  Widget errorImage() {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
//        color: gray,
          borderRadius: BorderRadius.circular(width / 2)),
      child: Image.asset(
        isProfile
            ? 'assets/assets.images/rating_avatar.png'
            : 'assets/assets.images/placeholder.jpg',
        width: width,
        height: height,
        fit: boxFit,
      ),
    );
  }
}
