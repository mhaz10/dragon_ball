import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dragon_ball/core/errors/failures.dart';
import 'package:dragon_ball/core/models/chaaracters_model.dart';
import 'package:dragon_ball/core/models/single_character_model.dart';
import 'package:dragon_ball/core/utils/api_server.dart';
import 'package:dragon_ball/features/home/data/repos/home_repo.dart';

class HomeRepoImplementation  implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, CharactersModel>> fetchAllCharacters({int? page}) async {
    try {
      var data = await apiService.get(endPoint: 'characters?page=$page&limit=10');
      print(data['meta']['currentPage']);
      CharactersModel charactersModel = CharactersModel.fromJson(data);
      return right(charactersModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failure, SingleCharacterModel>> fetchSingleCharacter({required int id}) async {
    try {
      var data = await apiService.get(endPoint: 'characters/$id');
      SingleCharacterModel singleCharacterModel = SingleCharacterModel.fromJson(data);
      return right(singleCharacterModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}