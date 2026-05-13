import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('smoke: Flutter test harness runs', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Text('ok'),
        ),
      ),
    );
    expect(find.text('ok'), findsOneWidget);
  });
}
