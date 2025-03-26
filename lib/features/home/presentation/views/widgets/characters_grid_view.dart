import 'package:dragon_ball/core/models/chaaracters_model.dart';
import 'package:flutter/material.dart';

import 'character_item.dart';

class CharactersGridView extends StatelessWidget {
  const CharactersGridView({super.key, required this.charactersModel});

  final CharactersModel charactersModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 14,
          childAspectRatio: 1.4/3.62,
      ),
      itemCount: charactersModel.items.length,
      itemBuilder: (context, index) => CharacterItem(item: charactersModel.items[index]),
    );
  }
}