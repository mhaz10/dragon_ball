import 'package:dragon_ball/features/favorite/manger/favorite_characters/favorite_characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'custom_favorite_item.dart';

class FavoritesViewBody extends StatefulWidget {
  const FavoritesViewBody({super.key});

  @override
  State<FavoritesViewBody> createState() => _FavoritesViewBodyState();
}

class _FavoritesViewBodyState extends State<FavoritesViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoriteCharactersCubit>(context).fetchFavoriteCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text('Favorites Characters'),
        ),

        BlocBuilder<FavoriteCharactersCubit, FavoriteCharactersState>(
          builder: (context, state) {
            if (state is FetchFavoriteCharactersSuccess) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => CustomFavoriteItem(
                    characterModel: state.characters[index],
                  ),
                  childCount: state.characters.length,
                ),
              );
            } else if (state is FetchFavoriteCharactersFailure) {
              return SliverToBoxAdapter(
                child: Center(child: Text('Error: ${state.errorMessage}')),
              );
            } else {
              return SliverToBoxAdapter(child: Center(child: SizedBox()));
            }
          },
        ),
      ],
    );
  }
}
