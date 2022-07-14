import 'package:config/base_localisation.dart';
import 'package:custom_1/states/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({required this.localisation, super.key});

  final BaseLocalisation localisation;

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  late CounterCubit _counterCubit;

  @override
  void initState() {
    super.initState();

    _counterCubit = BlocProvider.of<CounterCubit>(context);
    _counterCubit.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.localisation.labelAppName),
        ),
        body: BlocBuilder<CounterCubit, CounterState>(
            builder: (BuildContext context, CounterState state) {
          if (state is CounterIncremented) {
            return Center(
              child: Text('Counter is: ${state.counter}'),
            );
          }
          return Center(
            child: Text(widget.localisation.labelAppName),
          );
        }));
  }

  @override
  void dispose() {
    _counterCubit.dispose();
    super.dispose();
  }
}
