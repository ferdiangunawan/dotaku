import 'package:bloc/bloc.dart';
import 'package:dotaku/model/hero.dart';
import 'package:dotaku/service/hero_services.dart';
import 'package:dotaku/service/service_exception.dart';
import 'package:equatable/equatable.dart';

part 'heroes_state.dart';

class HeroesCubit extends Cubit<HeroesState> {
  HeroesCubit() : super(const HeroesLoading());

  final List<String> _filterChip = [];

  void fetchHeroes() async {
    try {
      emit(HeroesLoading(heroesList: state.heroesLists));
      var data = await Services.loadHero();
      emit(HeroesLoaded(heroesList: data));
    } on ServiceException catch (e) {
      emit(HeroesError(message: e.message ?? "A network error occured."));
    }
  }

  void filterHeroes(String filter, bool value) async {
    try {
      List<Heroes> resultFilter = [];
      if (value == true) {
        _filterChip.add(filter);
      } else {
        _filterChip.remove(filter);
      }

      emit(HeroesLoading(heroesList: state.heroesLists));
      var data = await Services.loadHero();

      if (_filterChip.isEmpty) {
        resultFilter = data;
      }
      for (var i in _filterChip) {
        resultFilter = data.where((element) => element.roles!.contains(i)).toList();
      }
      emit(HeroesLoaded(heroesList: resultFilter));
    } on ServiceException catch (e) {
      emit(HeroesError(message: e.message ?? "A network error occured."));
    }
  }
}
