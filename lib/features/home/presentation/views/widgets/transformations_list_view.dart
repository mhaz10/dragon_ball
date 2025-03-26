import 'package:dragon_ball/core/models/single_character_model.dart';
import 'package:dragon_ball/features/home/presentation/views/widgets/transformation_item.dart';
import 'package:flutter/material.dart';

class TransformationsListView extends StatelessWidget {
  const TransformationsListView({super.key, required this.transformation});

  final List<Transformation> transformation;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => TransformationItem(transformation: transformation[index],),
        separatorBuilder: (context, index) => SizedBox(width: 12,),
        itemCount: transformation.length);
  }
}