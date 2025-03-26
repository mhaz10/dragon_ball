import 'package:dragon_ball/core/widgets/shimmer_loading_effect.dart';
import 'package:flutter/material.dart';

class CharacterItemLoading extends StatelessWidget {
  const CharacterItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerLoadingEffect(height: 250,topRight: 18, topLeft: 18,),

        Container(
          height: 214,
          width: 180,
          decoration: BoxDecoration(
              color: Colors.white.withAlpha(24),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18), bottomRight: Radius.circular(18))
          ),
          padding: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 8,),
              ShimmerLoadingEffect(height: 18, width: 80, topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 8,),
              SizedBox(height: 10,),
              ShimmerLoadingEffect(height: 14, width: 160, topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 8,),
              SizedBox(height: 10,),
              ShimmerLoadingEffect(height: 16, width: 80, topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 8,),
              SizedBox(height: 10,),
              ShimmerLoadingEffect(height: 14, width: 140, topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 8,),
              SizedBox(height: 10,),
              ShimmerLoadingEffect(height: 16, width: 80, topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 8,),
              SizedBox(height: 10,),
              ShimmerLoadingEffect(height: 14, width: 140, topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 8,),
              SizedBox(height: 10,),
              ShimmerLoadingEffect(height: 16, width: 80, topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 8,),
              SizedBox(height: 10,),
              ShimmerLoadingEffect(height: 14, width: 120, topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 8,),
            ],
          ),
        )
      ],
    );
  }
}
