import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_admin_kit/core/widgets/app_button.dart';
import 'package:flutter_admin_kit/core/widgets/app_card.dart';

void main() {
  group('AppButton Tests', () {
    testWidgets('displays text and responds to taps', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              text: 'Submit',
              onPressed: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      // Verify text is displayed
      expect(find.text('Submit'), findsOneWidget);

      // Tap button and verify callback
      await tester.tap(find.text('Submit'));
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('shows loading indicator when isLoading is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppButton(
              text: 'Submit',
              isLoading: true,
            ),
          ),
        ),
      );

      // Verify text is NOT visible (hidden by loading indicator)
      expect(find.text('Submit'), findsNothing);

      // Verify CircularProgressIndicator is shown
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  group('AppCard Tests', () {
    testWidgets('displays title and child content', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppCard(
              title: 'Card Title',
              child: Text('Card Content'),
            ),
          ),
        ),
      );

      expect(find.text('Card Title'), findsOneWidget);
      expect(find.text('Card Content'), findsOneWidget);
    });
  });
}
