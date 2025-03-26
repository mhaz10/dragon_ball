part of 'single_character_cubit.dart';

@immutable
sealed class SingleCharacterState {}

final class SingleCharacterInitial extends SingleCharacterState {}

final class SingleCharacterLoading extends SingleCharacterState {}

final class SingleCharacterFailure extends SingleCharacterState {
  final String errorMessage;

  SingleCharacterFailure(this.errorMessage);
}

final class SingleCharacterSuccess extends SingleCharacterState {
  final SingleCharacterModel singleCharacterModel;

  SingleCharacterSuccess(this.singleCharacterModel);
}