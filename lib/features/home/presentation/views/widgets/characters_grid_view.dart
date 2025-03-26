import 'package:dragon_ball/core/models/chaaracters_model.dart';
import 'package:flutter/material.dart';

import 'character_item.dart';

class CharactersGridView extends StatelessWidget {
  const CharactersGridView({super.key, required this.characters, required this.crossAxisCount, required this.characterDetail,});

  final List<Item> characters;
  final int crossAxisCount;
  final bool characterDetail;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 14,
          childAspectRatio: characterDetail ? 1.4/3.62 : 1.4/3,
      ),
      itemCount: characters.length,
      itemBuilder: (context, index) => CharacterItem(item: characters[index], characterDetail: characterDetail,),
    );
  }
}