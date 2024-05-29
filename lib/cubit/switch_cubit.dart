import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class SwitchCubit extends Cubit<bool> {
  SwitchCubit() : super(false);

  void switchToggle(bool value) {
    emit(value);
    log("this is value of switch state after toggling>>>>>>: $state");
  }
}
