import 'package:dartz/dartz.dart';
import 'package:dragon_ball/core/models/chaaracters_model.dart';
import 'package:dragon_ball/core/models/single_character_model.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, CharactersModel>> fetchAllCharacters({int? page});
  Future<Either<Failure, SingleCharacterModel>> fetchSingleCharacter({required int id});
}