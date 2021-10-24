import 'package:bloc/bloc.dart';
import 'package:dotaku/model/hero.dart';
import 'package:dotaku/service/hero_services.dart';
import 'package:dotaku/service/service_exception.dart';
import 'package:equatable/equatable.dart';

part 'similar_state.dart';

class HeroesSimilarCubit extends Cubit<HeroesSimilarState> {
  HeroesSimilarCubit() : super(const HeroesSimilarLoading());

  void fetchSimilarHeroes(String attr) async {
    try {
      emit(HeroesSimilarLoading(heroesList: state.heroesLists));
      var data = await Services.similarHero(attr);
      if (attr == 'agi') {
        data.sort((b, a) => (a.moveSpeed!.compareTo(b.moveSpeed!)));
      } else if (attr == 'str') {
        data.sort((b, a) => (a.baseAttackMax!.compareTo(b.baseAttackMax!)));
      } else {
        data.sort((b, a) => (a.baseMana!.compareTo(b.baseMana!)));
      }
      emit(HeroesSimilarLoaded(heroesList: data));
    } on ServiceException catch (e) {
      emit(HeroesSimilarError(message: e.message));
    }
  }
}
