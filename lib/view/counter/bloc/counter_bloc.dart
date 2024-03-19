import 'dart:async';

import 'package:bloc_pattern/state_managment/bloc.dart';

import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(super.initialState) {
    on<IncrementEvenet>(_onIncrement);

    on<DecrementEvenet>(_onDecrement);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(IncrementEvenet(1));
    });
  }

  Timer? _timer;

  void _onIncrement(IncrementEvenet event, Emitter<int> emit) {
    emit(state + event.value);
  }

  void _onDecrement(DecrementEvenet event, Emitter<int> emit) {
    emit(state + event.value);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
