import 'package:dragon_ball/features/home/presentation/views/widgets/character_item_loading.dart';
import 'package:flutter/material.dart';

class CharactersLoadingGridView extends StatelessWidget {
  const CharactersLoadingGridView({super.key});

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
      itemCount: 10,
      itemBuilder: (context, index) => CharacterItemLoading(),
    );
  }
}
