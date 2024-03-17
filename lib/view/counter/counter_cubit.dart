import 'package:bloc_pattern/state_managment/cubit.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({super.initialState = 0});

  void increment() {
    emit(state + 1);
  }
}
