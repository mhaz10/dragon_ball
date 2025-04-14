import 'package:dragon_ball/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_image.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 40, bottom: 20),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kFavoritesView);
              },
              child: CustomImage(image: 'assets/images/dragon_ball_logo (1).png', height: 55, width: 55,)),
          const Spacer(),
          IconButton(onPressed: () {
            GoRouter.of(context).push(AppRouter.kSearchView);
          }, icon: Icon(Icons.search))
        ],
      ),
    );
  }
}