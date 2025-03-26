import 'package:dragon_ball/core/widgets/custom_error_widget.dart';
import 'package:dragon_ball/features/home/presentation/manger/all_characters/all_characters_cubit.dart';
import 'package:dragon_ball/features/home/presentation/views/widgets/characters_loading_grid_view.dart';
import 'package:dragon_ball/features/home/presentation/views/widgets/page_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'characters_grid_view.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllCharactersCubit, AllCharactersState>(
      builder: (context, state) {
        if (state is AllCharactersSuccess) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CustomAppBar(),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: CharactersGridView(characters: state.charactersModel.items, crossAxisCount: 2,characterDetail: true,),
              ),

              SliverToBoxAdapter(
                child: PageInfo(charactersModel: state.charactersModel,),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              CustomAppBar(),
              Expanded(
                  child: CharactersLoadingGridView(isCharacterDetail: true, crossAxisCount: 2,))
            ],
          );
        }
      }, listener: (BuildContext context, AllCharactersState state) {
        if (state is AllCharactersFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: CustomErrorWidget(errorMessage: state.errorMessage),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
            ));
        }
      },
    );
  }
}










