import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.image, required this.height, this.width = 0});

  final String image;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, height: height, width: width);
  }
}