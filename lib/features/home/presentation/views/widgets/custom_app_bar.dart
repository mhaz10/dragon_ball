import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_image.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 40, bottom: 20),
      child: Row(
        children: [
          CustomImage(image: 'assets/images/dragon_ball_logo (1).png', height: 55, width: 55,),
          const Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
      ),
    );
  }
}