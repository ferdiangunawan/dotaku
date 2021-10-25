import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chips_state.dart';

class ChipsCubit extends Cubit<ChipsState> {
  ChipsCubit() : super(ChipsInitial());
}
