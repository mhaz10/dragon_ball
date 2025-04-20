import 'package:dragon_ball/core/utils/%20service_locator.dart';
import 'package:dragon_ball/features/favorite/manger/favorite_characters/favorite_characters_cubit.dart';
import 'package:dragon_ball/features/home/data/repos/home_repo_implementation%20.dart';
import 'package:dragon_ball/features/home/presentation/manger/add_favorite_character/add_favorite_character_cubit.dart';
import 'package:dragon_ball/features/home/presentation/manger/single_character/single_character_cubit.dart';
import 'package:dragon_ball/features/home/presentation/views/widgets/character_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterDetailsView extends StatelessWidget {
  const CharacterDetailsView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SingleCharacterCubit(getIt<HomeRepoImplementation>())..fetchSingleCharacter(id: id),),
        BlocProvider(create: (context) => AddFavoriteCharacterCubit()),
      ],
      child: Scaffold(
        body: SafeArea(
            child: CharacterDetailsViewBody()),
      ),
    );
  }
}
