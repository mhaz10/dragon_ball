import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/single_character_model.dart';
import '../../../../../core/utils/constants.dart';

part 'add_favorite_character_state.dart';

class AddFavoriteCharacterCubit extends Cubit<AddFavoriteCharacterState> {
  AddFavoriteCharacterCubit() : super(AddFavoriteCharacterInitial());

  var characterBox = Hive.box<SingleCharacterModel>(kFavoriteCharacterBox);

  checkIfCharacterIsFavorite(SingleCharacterModel character) {
    if (characterBox.containsKey(character.id)) {
      emit(SavedFavoriteCharacter());
    }
  }

  addFavoriteCharacter(SingleCharacterModel character) async {

    if (characterBox.containsKey(character.id)) {
      deleteFavoriteCharacter(character.id!);
    }
    else {
      try {
        await characterBox.put(character.id, character);
        print('Saving character with ID: ${character.id}');
        emit(AddFavoriteCharacterSuccess());
      } catch(e) {
        emit(AddFavoriteCharacterFailure(e.toString()));
      }
    }

    checkIfCharacterIsFavorite(character);
  }

  deleteFavoriteCharacter(int id) async {
    try {
      await characterBox.delete(id);
      emit(DeleteFavoriteCharacterSuccess());
    } catch (e) {
      emit(DeleteFavoriteCharacterFailure(e.toString()));
    }
  }
}
