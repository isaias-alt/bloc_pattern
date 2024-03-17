import 'package:bloc_pattern/state_managment/bloc.dart';

import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(super.initialState);
}
