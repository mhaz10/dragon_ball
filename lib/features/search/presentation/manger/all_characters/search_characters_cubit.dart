import 'package:bloc/bloc.dart';
import 'package:dragon_ball/core/models/chaaracters_model.dart';
import 'package:dragon_ball/features/search/presentation/manger/all_characters/search_characters_state.dart';
import '../../../../home/data/repos/home_repo.dart';

class SearchCharactersCubit extends Cubit<SearchCharactersState> {
  final HomeRepo homeRepo;
  SearchCharactersCubit(this.homeRepo) : super(SearchCharactersInitial());

  List<Item> allCharacters = [];
  List<Item> filteredCharacters = [];
  int page = 1;
  bool isLoading = false;

  Future<void> fetchAllCharacters() async {
    if (isLoading || page >= 6) return;

    isLoading = true;

    final result = await homeRepo.fetchAllCharacters(page: page);
    result.fold(
      (failure) {
        emit(SearchCharactersFailure(failure.errorMessage));
      },
      (charactersModel) {
        if (charactersModel.items.isNotEmpty) {
          allCharacters.addAll(charactersModel.items);
          page++;
          emit(SearchCharactersSuccess(allCharacters));
        }
      },
    );

    isLoading = false;
  }

  void searchCharacter(String query) {
    final filteredCharacters =
        allCharacters.where((character) {
          final name = character.name?.toLowerCase() ?? '';
          return name.contains(query.toLowerCase());
        }).toList();
    emit(SearchCharactersSuccess(filteredCharacters));
  }
}
