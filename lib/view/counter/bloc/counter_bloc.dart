import 'package:bloc_pattern/state_managment/bloc.dart';

import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(super.initialState) {
    on<IncrementEvenet>(_onIncrement);

    on<DecrementEvenet>(_onDecrement);
  }

  void _onIncrement(IncrementEvenet event, Emitter<int> emit) {
    emit(state + event.value);
  }

  void _onDecrement(DecrementEvenet event, Emitter<int> emit) {
    emit(state + event.value);
  }
}
