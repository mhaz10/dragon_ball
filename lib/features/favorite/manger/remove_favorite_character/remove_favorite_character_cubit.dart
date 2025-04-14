import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../core/models/single_character_model.dart';
import '../../../../core/utils/constants.dart';

part 'remove_favorite_character_state.dart';

class RemoveFavoriteCharacterCubit extends Cubit<RemoveFavoriteCharacterState> {
  RemoveFavoriteCharacterCubit() : super(AddFavoriteCharacterInitial());

  var characterBox = Hive.box<SingleCharacterModel>(kFavoriteCharacterBox);

  removeFavoriteCharacter(SingleCharacterModel character) async {
    try {
      await characterBox.delete(character.id);
      emit(RemoveFavoriteCharacterSuccess());
    } catch (e) {
      emit(RemoveFavoriteCharacterFailure(e.toString()));
    }
  }


}
