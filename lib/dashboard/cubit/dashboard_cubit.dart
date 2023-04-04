import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  void increment() => emit(state);
  void decrement() => emit(state);
}
