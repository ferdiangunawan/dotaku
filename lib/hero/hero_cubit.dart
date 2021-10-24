import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotaku/hero/hero_state.dart';

class HeroCubit extends Cubit<HeroState> {
	HeroCubit() : super(HeroState(isLoading: true));
	
	Future<void> loadInitialData() async {
		final stableState = state;
		try {
		  emit(state.copyWith(isLoading: true));
	
		  // TODO your code here
	
		  emit(state.copyWith(isLoading: false));
		} catch (error) {
		  emit(state.copyWith(error: error.toString()));
		  emit(stableState.copyWith(isLoading: false));
		}
	}
}
