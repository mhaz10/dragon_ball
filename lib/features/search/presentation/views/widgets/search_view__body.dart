import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../home/presentation/views/widgets/characters_grid_view.dart';
import '../../../../home/presentation/views/widgets/characters_loading_grid_view.dart';
import '../../manger/all_characters/search_characters_cubit.dart';
import '../../manger/all_characters/search_characters_state.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<SearchCharactersCubit>().fetchAllCharacters();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCharactersCubit, SearchCharactersState>(
      builder: (context, state) {
        if (state is SearchCharactersSuccess) {
          return CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomSearchTextField(onChanged: (value) {
                        context
                            .read<SearchCharactersCubit>()
                            .searchCharacter(value);

                      },),
                    ),
                  ],
                ),
              ),

              SliverToBoxAdapter(
                child: CharactersGridView(
                  characters: state.characters,
                  crossAxisCount: 3,
                  characterDetail: false,
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomSearchTextField(),
              ),
              Expanded(
                child: CharactersLoadingGridView(
                  isCharacterDetail: false,
                  crossAxisCount: 3,
                ),
              ),
            ],
          );
        }
      },
      listener: (BuildContext context, SearchCharactersState state) {
        if (state is SearchCharactersFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: CustomErrorWidget(errorMessage: state.errorMessage),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
        }
      },
    );
  }
}
