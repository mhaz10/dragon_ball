part of 'remove_favorite_character_cubit.dart';

@immutable
sealed class RemoveFavoriteCharacterState {}

final class AddFavoriteCharacterInitial extends RemoveFavoriteCharacterState {}

final class RemoveFavoriteCharacterSuccess extends RemoveFavoriteCharacterState {}

final class RemoveFavoriteCharacterFailure extends RemoveFavoriteCharacterState {
  final String errorMessage;

  RemoveFavoriteCharacterFailure(this.errorMessage);
}
