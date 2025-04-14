part of 'add_favorite_character_cubit.dart';

@immutable
sealed class AddFavoriteCharacterState {}

final class AddFavoriteCharacterInitial extends AddFavoriteCharacterState {}

final class SavedFavoriteCharacter extends AddFavoriteCharacterState {}

final class AddFavoriteCharacterFailure extends AddFavoriteCharacterState {
  final String errorMessage;

  AddFavoriteCharacterFailure(this.errorMessage);
}

final class AddFavoriteCharacterSuccess extends AddFavoriteCharacterState {}

final class DeleteFavoriteCharacterSuccess extends AddFavoriteCharacterState {}

final class DeleteFavoriteCharacterFailure extends AddFavoriteCharacterState {
  final String errorMessage;

  DeleteFavoriteCharacterFailure(this.errorMessage);
}
