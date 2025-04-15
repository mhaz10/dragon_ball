import 'package:dragon_ball/core/widgets/expanded_text.dart';
import 'package:dragon_ball/features/home/presentation/manger/single_character/single_character_cubit.dart';
import 'package:dragon_ball/features/home/presentation/views/widgets/transformations_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import 'custom_sliver_app_bar.dart';
import 'origin_planet_item.dart';

class CharacterDetailsViewBody extends StatelessWidget {
  const CharacterDetailsViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingleCharacterCubit, SingleCharacterState>(
      listener: (context, state) {
        if (state is SingleCharacterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: CustomErrorWidget(errorMessage: state.errorMessage),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ));
        }
      },
      builder: (context, state) {
        if (state is SingleCharacterSuccess) {
          return CustomScrollView(
            slivers: [
              CustomSliverAppBar(characterModel: state.singleCharacterModel,),

              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.singleCharacterModel.name!, style: Styles.textStyle28, maxLines: 1, overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 6,),
                      Text('${state.singleCharacterModel.race} - ${state.singleCharacterModel.gender}', style: Styles.textStyle16Amber, maxLines: 1, overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 6,),
                      Text('description:', style: Styles.textStyle18),
                      ExpandedText(text: state.singleCharacterModel.description!),
                      SizedBox(height: 6,),
                      Text('affiliation :', style: Styles.textStyle18, maxLines: 1, overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 6,),
                      Text(state.singleCharacterModel.affiliation!, style: Styles.textStyle16Amber, maxLines: 1, overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 6,),
                      Text('origin planet :', style: Styles.textStyle18, maxLines: 1, overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 8,),
                      OriginPlanetItem(originPlanet: state.singleCharacterModel.originPlanet!,),
                      SizedBox(height: 6,),
                      Text('transformations :', style: Styles.textStyle18, maxLines: 1, overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 8,),
                      SizedBox(
                          height: 200,
                          child: TransformationsListView(transformation: state.singleCharacterModel.transformations,))
                    ],
                  ),
                ),
              )
            ],
          );
        }
        else {
          return Column(
            children: [
              LinearProgressIndicator(
                color: Colors.amber,
              )
            ],
          );
        }
      },
);
  }
}














