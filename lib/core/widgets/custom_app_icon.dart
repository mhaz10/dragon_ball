import 'package:flutter/material.dart';

class CustomAppIcon extends StatelessWidget {
  const CustomAppIcon({super.key, required this.icon, this.onPressed});

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black.withAlpha(100),
      radius: 20,
      child: Center(
          child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: onPressed,
              icon: Icon(icon, color: Colors.white,))),
    );
  }
}