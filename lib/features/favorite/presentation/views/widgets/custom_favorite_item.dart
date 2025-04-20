import 'package:dragon_ball/core/models/single_character_model.dart';
import 'package:dragon_ball/core/utils/app_router.dart';
import 'package:dragon_ball/features/favorite/manger/favorite_characters/favorite_characters_cubit.dart';
import 'package:dragon_ball/features/favorite/manger/remove_favorite_character/remove_favorite_character_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_app_icon.dart';

class CustomFavoriteItem extends StatelessWidget {
  const CustomFavoriteItem({super.key, required this.characterModel});

  final SingleCharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      RemoveFavoriteCharacterCubit,
      RemoveFavoriteCharacterState
    >(
      listener: (context, state) {
        if (state is RemoveFavoriteCharacterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Removed from favorites'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
            ),
          );
        }
      },

      builder: (context, state) {
        return InkWell(
          onTap: ()async {
            var result= await GoRouter.of(
              context,
            ).push(AppRouter.kCharacterDetails, extra: characterModel.id);
            if (result != null) {
              BlocProvider.of<FavoriteCharactersCubit>(
                context,
              ).fetchFavoriteCharacters();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/background.jpg',
                        height: 160,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        characterModel.image!,
                        height: 160,
                        width: 140,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      width: 200,
                      height: 160,
                      decoration: BoxDecoration(color: Colors.grey[800]),
                      padding: EdgeInsets.only(left: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                characterModel.name!,
                                style: Styles.textStyle20,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${characterModel.race} - ${characterModel.gender}',
                                style: Styles.textStyle14,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text('Base KI:', style: Styles.textStyle16),
                              Text(
                                characterModel.ki!,
                                style: Styles.textStyle14,
                              ),
                              Text('Total KI:', style: Styles.textStyle16),
                              Text(
                                characterModel.maxKi!,
                                style: Styles.textStyle14,
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                              right: 10,
                            ),
                            child: CustomAppIcon(
                              icon: Icons.favorite,
                              onPressed: () {
                                BlocProvider.of<RemoveFavoriteCharacterCubit>(
                                  context,
                                ).removeFavoriteCharacter(characterModel);
                                BlocProvider.of<FavoriteCharactersCubit>(
                                  context,
                                ).fetchFavoriteCharacters();
                              },
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
