part of 'favorite_characters_cubit.dart';

@immutable
sealed class FavoriteCharactersState {}

final class FavoriteCharactersInitial extends FavoriteCharactersState {}

final class FavoriteCharactersEmpty extends FavoriteCharactersState {}

final class FetchFavoriteCharactersSuccess extends FavoriteCharactersState {
  final List<SingleCharacterModel> characters;

  FetchFavoriteCharactersSuccess(this.characters);
}

final class FetchFavoriteCharactersFailure extends FavoriteCharactersState {
  final String errorMessage;

  FetchFavoriteCharactersFailure(this.errorMessage);
}

