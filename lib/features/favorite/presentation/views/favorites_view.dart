import 'package:dragon_ball/features/favorite/manger/favorite_characters/favorite_characters_cubit.dart';
import 'package:dragon_ball/features/favorite/presentation/views/widgets/favoites_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/remove_favorite_character/remove_favorite_character_cubit.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoriteCharactersCubit(),
        ),
        BlocProvider(
          create: (context) => RemoveFavoriteCharacterCubit(),
        ),
      ],
      child: Scaffold(
        body: FavoritesViewBody(),),
    );
  }
}
