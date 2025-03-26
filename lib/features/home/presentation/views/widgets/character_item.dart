import 'package:dragon_ball/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/models/chaaracters_model.dart';
import '../../../../../core/utils/styles.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kCharacterDetails , extra: item.id);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset('assets/images/background.jpg', height: 250 ,width: 180, fit: BoxFit.cover,),
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.grey[800]
                  ),
                  padding: EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4,),
                      Text(item.name!, style: Styles.textStyle20, maxLines: 1, overflow: TextOverflow.ellipsis,),
                      Text('${item.race} - ${item.gender}', style: Styles.textStyle14, maxLines: 1, overflow: TextOverflow.ellipsis,),
                      Text('Base KI:', style: Styles.textStyle16),
                      Text(item.ki.toString(), style: Styles.textStyle14),
                      Text('Total KI:', style: Styles.textStyle16),
                      Text(item.maxKi!, style: Styles.textStyle14),
                      Text('Afilliation:', style: Styles.textStyle16),
                      Text(item.affiliation!, style: Styles.textStyle14),
                      SizedBox(height: 12,)
                    ],
                  ),
                )
              ],
            ),
            Image.network(item.image!, height: 250, width: 180,),
          ],
        ),
      ),
    );
  }
}