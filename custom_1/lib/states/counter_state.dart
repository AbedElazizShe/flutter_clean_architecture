part of 'counter_cubit.dart';

abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

class CounterInitial extends CounterState {
  const CounterInitial();
}

class CounterIncremented extends CounterState {
  const CounterIncremented(this.counter);

  final int counter;

  @override
  List<Object> get props => [counter];
}
