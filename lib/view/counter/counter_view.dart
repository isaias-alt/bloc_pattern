import 'package:bloc_pattern/state_managment/bloc_provider.dart';
import 'package:bloc_pattern/view/counter/bloc/counter_bloc.dart';
import 'package:bloc_pattern/view/counter/bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (_) => CounterBloc(0),
      child: Builder(
        builder: (context) {
          final bloc = context.watch<CounterBloc>();
          return Scaffold(
            body: Center(
              child: Text(
                '${bloc.state}',
                style: const TextStyle(fontSize: 25),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                bloc.add(IncrementEvenet(5));
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
