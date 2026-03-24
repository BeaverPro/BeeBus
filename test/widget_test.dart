import 'package:flutter_test/flutter_test.dart';
import 'package:beebus/main.dart';

void main() {
  testWidgets('App launches', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BeeBusApp());

    // Verify that the title is present.
    expect(find.text('BeeBus'), findsOneWidget);
  });
}
