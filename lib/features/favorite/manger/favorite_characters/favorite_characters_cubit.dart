import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/single_character_model.dart';
import '../../../../core/utils/constants.dart';

part 'favorite_characters_state.dart';

class FavoriteCharactersCubit extends Cubit<FavoriteCharactersState> {
  FavoriteCharactersCubit() : super(FavoriteCharactersInitial());

  var characterBox = Hive.box<SingleCharacterModel>(kFavoriteCharacterBox);

  fetchFavoriteCharacters() async {
    try {
      List<SingleCharacterModel> characters = characterBox.values.toList();
      emit(FetchFavoriteCharactersSuccess(characters));
    } catch (e) {
      emit(FetchFavoriteCharactersFailure(e.toString()));
    }
  }


}
