import 'package:flutter/material.dart';

class ShimmerLoadingEffect extends StatelessWidget {
  const ShimmerLoadingEffect({super.key, this.width, this.height, this.topRight = 0, this.topLeft = 0, this.bottomRight = 0, this.bottomLeft = 0, this.withAlpha = 40});

  final double? width ,height;
  final double  topRight, topLeft, bottomRight, bottomLeft;
  final int withAlpha;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(withAlpha),
        borderRadius: BorderRadius.only(topRight: Radius.circular(topRight), topLeft: Radius.circular(topLeft), bottomRight: Radius.circular(bottomRight), bottomLeft: Radius.circular(bottomLeft))
      ),
    );
  }
}
