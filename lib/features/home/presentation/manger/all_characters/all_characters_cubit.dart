import 'package:bloc/bloc.dart';
import 'package:dragon_ball/core/models/chaaracters_model.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/home_repo.dart';

part 'all_characters_state.dart';

class AllCharactersCubit extends Cubit<AllCharactersState> {
  final HomeRepo homeRepo;
  AllCharactersCubit(this.homeRepo) : super(AllCharactersInitial());

  Future<void> fetchAllCharacters({int? page}) async {
    emit(AllCharactersLoading());

    var result = await homeRepo.fetchAllCharacters(page: page);
    result.fold((failure) => emit(AllCharactersFailure(failure.errorMessage)), (charactersModel) => emit(AllCharactersSuccess(charactersModel)),);
  }
}
