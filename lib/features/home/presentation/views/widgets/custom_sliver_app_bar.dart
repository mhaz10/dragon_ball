import 'package:dragon_ball/core/models/single_character_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_app_icon.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.characterModel});

  final SingleCharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 75,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAppIcon(icon: Icons.close, onPressed: () {
            GoRouter.of(context).pop();
          },),
          CustomAppIcon(icon: Icons.favorite_border_outlined)
        ],
      ),
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
          ),
          width: double.infinity,
          padding: EdgeInsets.only(top: 5, bottom: 10),
          child: Center(child: Container(
            width: 60,
            height: 12,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.black.withAlpha(60),
                borderRadius: BorderRadius.circular(16)
            ),
          )),
        ),
      ),
      expandedHeight: 330,
      backgroundColor: Colors.grey,
      pinned: true,
      //floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Image.asset('assets/images/background.jpg', height: 340, width: double.infinity, fit: BoxFit.cover,),
            Image.network(characterModel.image!, height: 300, width: 400,),
          ],
        ),
      ),
    );
  }
}