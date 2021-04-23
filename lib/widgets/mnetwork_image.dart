import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MNetworkImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit boxFit;

  MNetworkImage(
      {this.width, this.boxFit, this.height, @required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      width: width,
      height: height,
      fit: boxFit ?? BoxFit.contain,
      placeholder: (context, url) =>
          _buildSizedWidget(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
          _buildSizedWidget(child: Icon(Icons.error)),
    );
  }

  _buildSizedWidget({Widget child}) {
    return Container(
      width: width,
      height: height,
      child: Center(child: child),
    );
  }
}
