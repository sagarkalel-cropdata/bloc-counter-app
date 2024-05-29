import 'dart:developer';

import 'package:bloc_counter_app/bloc/counter_bloc.dart';
import 'package:bloc_counter_app/cubit/switch_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(this.switchCubit, this.counterBloc) : super(0);
  final SwitchCubit switchCubit;
  final CounterBloc counterBloc;

  void inc() {
    log('this is value of switchState passed variable: ${switchCubit.state}');
    if (switchCubit.state) {
      counterBloc.add(CounterEvent.inc);
    } else {
      emit(state + 1);
    }
  }

  void dec() {
    log('this is value of switchState passed variable: ${switchCubit.state}');
    if (switchCubit.state) {
      counterBloc.add(CounterEvent.desc);
    } else {
      emit(state - 1);
    }
  }
}
