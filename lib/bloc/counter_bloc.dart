import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { inc, desc }

class CounterState {
  final int counter;

  CounterState(this.counter);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    log('this counter block event function called here');
    if (event == CounterEvent.inc) {
      yield CounterState(state.counter + 1);
    } else if (event == CounterEvent.desc) {
      yield CounterState(state.counter - 1);
    }
  }
}
