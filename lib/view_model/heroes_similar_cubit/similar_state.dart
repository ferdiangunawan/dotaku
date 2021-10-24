part of 'similar_cubit.dart';

abstract class HeroesSimilarState extends Equatable {
  final List<Heroes>? heroesLists;
  const HeroesSimilarState(this.heroesLists);

  @override
  List<Object> get props => [];
}

class HeroesSimilarLoading extends HeroesSimilarState {
  final List<Heroes>? heroesList;
  const HeroesSimilarLoading({this.heroesList}) : super(heroesList);
}

class HeroesSimilarLoaded extends HeroesSimilarState {
  final List<Heroes>? heroesList;
  const HeroesSimilarLoaded({this.heroesList}) : super(heroesList);
}

class HeroesSimilarError extends HeroesSimilarState {
  final String? message;
  const HeroesSimilarError({this.message}) : super(null);
}
