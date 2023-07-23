import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/features/dashboard/dashboard.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockDashboardCubit extends MockCubit<DashboardState>
    implements DashboardCubit {}

void main() {
  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpApp(const DashboardPage());
      expect(find.byType(DashboardView), findsOneWidget);
    });
  });

  group('CounterView', () {
    late DashboardCubit counterCubit;

    setUp(() {
      counterCubit = MockDashboardCubit();
    });

    testWidgets('renders current count', (tester) async {
      const state = DashboardState.initial();
      when(() => counterCubit.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterCubit,
          child: const DashboardView(),
        ),
      );
      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped',
        (tester) async {
      when(() => counterCubit.state).thenReturn(const DashboardState.initial());
      when(() => counterCubit.increment()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterCubit,
          child: const DashboardView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.add));
      verify(() => counterCubit.increment()).called(1);
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      when(() => counterCubit.state).thenReturn(const DashboardState.initial());
      when(() => counterCubit.decrement()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterCubit,
          child: const DashboardView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.remove));
      verify(() => counterCubit.decrement()).called(1);
    });
  });
}
