import 'package:bloc/bloc.dart';
import 'package:dragon_ball/core/models/single_character_model.dart';
import 'package:dragon_ball/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'single_character_state.dart';

class SingleCharacterCubit extends Cubit<SingleCharacterState> {
  final HomeRepo homeRepo;

  SingleCharacterCubit(this.homeRepo) : super(SingleCharacterInitial());

  Future<void> fetchSingleCharacter({required int id}) async {
    emit(SingleCharacterLoading());

    var result = await homeRepo.fetchSingleCharacter(id: id);
    result.fold((failure) => emit(SingleCharacterFailure(failure.errorMessage)), (singleCharacterModel) => emit(SingleCharacterSuccess(singleCharacterModel)),);
  }
}
