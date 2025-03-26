import 'package:dragon_ball/core/models/single_character_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class OriginPlanetItem extends StatelessWidget {
  const OriginPlanetItem({super.key, required this.originPlanet});

  final OriginPlanet originPlanet;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        children: [
          Column(
            children: [
              Image.network(originPlanet.image!, height: 160, width: 160, fit: BoxFit.cover,),
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
                    Text(originPlanet.name!, style: Styles.textStyle20, maxLines: 1, overflow: TextOverflow.ellipsis,),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}