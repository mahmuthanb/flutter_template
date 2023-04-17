import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_template/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(DashboardCubit().state, equals(0));
    });

    blocTest<DashboardCubit, DashboardState>(
      'emits [1] when increment is called',
      build: DashboardCubit.new,
      act: (cubit) => cubit.increment(),
      expect: () => [equals(1)],
    );

    blocTest<DashboardCubit, DashboardState>(
      'emits [-1] when decrement is called',
      build: DashboardCubit.new,
      act: (cubit) => cubit.decrement(),
      expect: () => [equals(-1)],
    );
  });
}
