import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial());

  late StreamSubscription _streamSubscription;

  void start() {
    _streamSubscription =
        GetIt.instance<NotifyUpdatesUseCase>()().listen((int counter) {
      emit(CounterIncremented(counter));
    });
  }

  void dispose() {
    _streamSubscription.cancel();
  }
}
