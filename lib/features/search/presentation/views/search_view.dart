import 'package:dragon_ball/core/utils/%20service_locator.dart';
import 'package:dragon_ball/features/home/data/repos/home_repo_implementation%20.dart';
import 'package:dragon_ball/features/search/presentation/manger/all_characters/search_characters_cubit.dart';
import 'package:dragon_ball/features/search/presentation/views/widgets/search_view__body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchCharactersCubit(getIt<HomeRepoImplementation>())..fetchAllCharacters(),
        child: SafeArea(
            child: SearchViewBody()),
      ),
    );
  }
}
