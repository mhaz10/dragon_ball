import 'package:bloc/bloc.dart';
import 'package:dragon_ball/core/models/chaaracters_model.dart';
import 'package:dragon_ball/features/search/presentation/manger/all_characters/search_characters_state.dart';
import '../../../../home/data/repos/home_repo.dart';

class SearchCharactersCubit extends Cubit<SearchCharactersState> {
  final HomeRepo homeRepo;
  SearchCharactersCubit(this.homeRepo) : super(SearchCharactersInitial());


  List<Item> allCharacters = [];
  int page = 1;
  bool isLoading = false;

  Future<void> fetchAllCharacters() async {
    emit(SearchCharactersLoading());

    if (isLoading) return;

    isLoading = true;

    var result = await homeRepo.fetchAllCharacters(page: page);
    result.fold(
          (failure) => emit(SearchCharactersFailure(failure.errorMessage)),
          (charactersModel) {
            if (charactersModel.items.isEmpty) {
              emit(SearchCharactersLoading());
            } else {
              allCharacters.addAll(charactersModel.items);
              isLoading = false;
              if (page > 6) {
                emit(SearchCharactersLoading());
              }
              page++;
              emit(SearchCharactersSuccess(allCharacters));
            }
          }
    );
  }
}
