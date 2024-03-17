import 'package:bloc_pattern/view/counter/counter_bloc.dart';
import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final _bloc = CounterBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.stream,
          initialData: _bloc.counter,
          builder: (_, snapshot) => Text(
            '${snapshot.data}',
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bloc.add(
            DecrementEvent(10),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}