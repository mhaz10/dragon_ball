import 'package:dragon_ball/core/models/single_character_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class TransformationItem extends StatelessWidget {
  const TransformationItem({super.key, required this.transformation});

  final Transformation transformation;

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        children: [
          Column(
            children: [
              Image.asset('assets/images/background.jpg', height: 160 ,width: 160, fit: BoxFit.cover,),
              Container(
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.grey[800]
                ),
                padding: EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4,),
                    Text(transformation.name!, style: Styles.textStyle20, maxLines: 1, overflow: TextOverflow.ellipsis,),
                  ],
                ),
              )
            ],
          ),
          Image.network(transformation.image!, height: 160, width: 160,),
        ],
      ),
    );
  }
}