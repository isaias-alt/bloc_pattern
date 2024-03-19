abstract class CounterEvent {
  final int value;

  CounterEvent(this.value);
}

class IncrementEvenet extends CounterEvent {
  IncrementEvenet(super.value);
}

class DecrementEvenet extends CounterEvent {
  DecrementEvenet(super.value);
}
