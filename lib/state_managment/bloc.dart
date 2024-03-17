import 'dart:async';

import 'package:flutter/foundation.dart';

import 'cubit.dart';

typedef Emitter<State> = void Function(State newState);
typedef EventHandler<E, State> = FutureOr<void> Function(
  E event,
  Emitter<State> emit,
);

abstract class Bloc<Event, State> extends Cubit<State> {
  Bloc(super.initialState);

  final _handlers = <Type, Function>{};

  @protected
  void on<E extends Event>(
    EventHandler<E, State> handler,
  ) {
    _handlers.putIfAbsent(E, () => handler);
  }

  void add(Event event) {
    assert(
      _handlers.containsKey(Event),
      'on<${Event.toString()}>(...) must be called in the contructor',
    );
    final fn = _handlers[Event] as EventHandler<Event, State>;
    fn(event, emit);
  }

  @visibleForTesting
  @override
  void emit(State newState) => super.emit(newState);
}
