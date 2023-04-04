import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<int> {
  DashboardCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
