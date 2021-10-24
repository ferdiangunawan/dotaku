import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'heroes_detail_state.dart';

class HeroesDetailCubit extends Cubit<HeroesDetailState> {
  HeroesDetailCubit() : super(HeroesDetailInitial());
}
