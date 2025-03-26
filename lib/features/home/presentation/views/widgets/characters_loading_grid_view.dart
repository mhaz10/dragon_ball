import 'package:dragon_ball/features/home/presentation/views/widgets/character_item_loading.dart';
import 'package:flutter/material.dart';

class CharactersLoadingGridView extends StatelessWidget {
  const CharactersLoadingGridView({super.key, required this.isCharacterDetail, required this.crossAxisCount});

  final bool isCharacterDetail;
  final int crossAxisCount;

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
        childAspectRatio: isCharacterDetail ? 1.4/3.62 : 1.4/3,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => CharacterItemLoading(isCharacterDetail: isCharacterDetail,),
    );
  }
}
