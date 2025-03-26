part of 'all_characters_cubit.dart';

@immutable
sealed class AllCharactersState {}

final class AllCharactersInitial extends AllCharactersState {}

final class AllCharactersLoading extends AllCharactersState {}

final class AllCharactersFailure extends AllCharactersState {
  final String errorMessage;

  AllCharactersFailure(this.errorMessage);
}

final class AllCharactersSuccess extends AllCharactersState {
  final CharactersModel charactersModel;

  AllCharactersSuccess(this.charactersModel);
}
