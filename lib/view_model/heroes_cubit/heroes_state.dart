part of 'heroes_cubit.dart';

@immutable
abstract class HeroesState extends Equatable {
  final List<Heroes>? heroesLists;
  const HeroesState(this.heroesLists);

  @override
  List<Object> get props => [];
}

class HeroesLoading extends HeroesState {
  final List<Heroes>? heroesList;
  const HeroesLoading({this.heroesList}) : super(heroesList);
}

class HeroesLoaded extends HeroesState {
  final List<Heroes>? heroesList;
  const HeroesLoaded({this.heroesList}) : super(heroesList);
}

class HeroesError extends HeroesState {
  final String? message;
  const HeroesError({this.message}) : super(null);
}
