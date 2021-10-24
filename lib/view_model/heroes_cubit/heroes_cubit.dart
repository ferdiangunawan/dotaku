import 'package:bloc/bloc.dart';
import 'package:dotaku/model/hero.dart';
import 'package:dotaku/service/hero_services.dart';
import 'package:dotaku/service/service_exception.dart';
import 'package:equatable/equatable.dart';

part 'heroes_state.dart';

class HeroesCubit extends Cubit<HeroesState> {
  HeroesCubit() : super(const HeroesLoading());

  void fetchHeroes() async {
    try {
      emit(HeroesLoading(heroesList: state.heroesLists));
      var data = await Services.loadHero();
      emit(HeroesLoaded(heroesList: data));
    } on ServiceException catch (e) {
      emit(HeroesError(message: e.message ?? "A network error occured."));
    }
  }
}
