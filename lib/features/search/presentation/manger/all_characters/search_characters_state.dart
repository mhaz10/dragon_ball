import '../../../../../core/models/chaaracters_model.dart';

sealed class SearchCharactersState {}

final class SearchCharactersInitial extends SearchCharactersState {}

final class SearchCharactersLoading extends SearchCharactersState {}

final class SearchCharactersFailure extends SearchCharactersState {
  final String errorMessage;

  SearchCharactersFailure(this.errorMessage);
}

final class SearchCharactersSuccess extends SearchCharactersState {
  final List<Item> characters;

  SearchCharactersSuccess(this.characters);
}
