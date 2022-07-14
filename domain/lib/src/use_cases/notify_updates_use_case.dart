import 'dart:async';

import 'package:injectable/injectable.dart';

@singleton
class NotifyUpdatesUseCase {
  NotifyUpdatesUseCase();

  Stream<int> call() async* {
    int counter = 0;

    Stream<int> stream = Stream.periodic(const Duration(seconds: 2), (index) {
      return counter++;
    });

    yield* stream;
  }
}
