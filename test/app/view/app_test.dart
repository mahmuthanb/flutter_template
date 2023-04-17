import 'package:flutter_template/features/app/app.dart';
import 'package:flutter_template/features/dashboard/dashboard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(DashboardPage), findsOneWidget);
    });
  });
}
