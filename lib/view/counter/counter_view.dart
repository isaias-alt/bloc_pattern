import 'package:bloc_pattern/view/counter/counter_cubit.dart';
import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final _cubit = CounterCubit();

  @override
  void dispose() {
    _cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<int>(
          stream: _cubit.stream,
          initialData: _cubit.state,
          builder: (_, snapshot) => Text(
            '${snapshot.data}',
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _cubit.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
