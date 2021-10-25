import 'package:bloc_test/bloc_test.dart';
import 'package:dotaku/model/hero.dart';
import 'package:dotaku/view_model/heroes_cubit/heroes_cubit.dart';
import 'package:dotaku/view_model/heroes_similar_cubit/similar_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Heroes Cubit fetch', () {
    blocTest<HeroesCubit, HeroesState>(
      'emits when no heroes is fetched.',
      build: () => HeroesCubit(),
      expect: () => const <Heroes>[],
    );
    blocTest<HeroesCubit, HeroesState>('emits when heroes is fetched.',
        build: () => HeroesCubit(), act: (cubit) => cubit.fetchHeroes(), expect: () => const [HeroesLoading(), HeroesLoaded()]);
  });
  group('Similar Cubit fetch', () {
    blocTest<HeroesSimilarCubit, HeroesSimilarState>(
      'emits when no heroes is fetched.',
      build: () => HeroesSimilarCubit(),
      expect: () => const <Heroes>[],
    );
    blocTest<HeroesSimilarCubit, HeroesSimilarState>('emits when Similar is fetched.',
        build: () => HeroesSimilarCubit(),
        act: (cubit) => cubit.fetchSimilarHeroes('Carry'),
        expect: () => const [HeroesSimilarLoading(), HeroesSimilarLoaded()]);
  });
}
