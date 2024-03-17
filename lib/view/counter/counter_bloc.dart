import 'dart:async';

abstract class CounterEvent {
  final int value;
  CounterEvent(this.value);
}

class IncrementEvent extends CounterEvent {
  IncrementEvent(super.value);
}

class DecrementEvent extends CounterEvent {
  DecrementEvent(super.value);
}

class CounterBloc {
  int _counter = 0;
  int get counter => _counter;

  final _controller = StreamController<int>.broadcast();
  Stream<int> get stream => _controller.stream;

  void add(CounterEvent event) {
    if (event is IncrementEvent) {
      emit(_counter + event.value);
    } else if (event is DecrementEvent) {
      emit(_counter - event.value);
    }
  }

  void emit(newCounter) {
    if (newCounter != _counter) {
      _counter = newCounter;
      _controller.add(_counter);
    }
  }

  void dispose() {
    _controller.close();
  }
}
