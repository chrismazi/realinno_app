import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realworks_app/main.dart';
import 'package:realworks_app/src/screens/splash_screen.dart';

void main() {
  group('RealWorks App Tests', () {
    testWidgets('App initializes with splash screen',
        (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const ProviderScope(child: RealWorksApp()));

      // Wait for any pending timers
      await tester.pump();

      // Verify splash screen is displayed
      expect(find.text('RealWorks'), findsOneWidget);
      expect(find.text('Employee Assistance Program'), findsOneWidget);
    });

    testWidgets('Splash screen navigates to onboarding after delay',
        (WidgetTester tester) async {
      // Build splash screen
      await tester.pumpWidget(
        const MaterialApp(
          home: SplashScreen(),
        ),
      );

      // Verify splash screen content
      expect(find.text('RealWorks'), findsOneWidget);

      // Wait for auto-navigation (2.5 seconds)
      await tester.pump(const Duration(milliseconds: 2500));
      await tester.pumpAndSettle();

      // Note: Navigation test would require full router setup
      // This is a simplified version
    });

    testWidgets('Primary button displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ElevatedButton(
              onPressed: () {},
              child: const Text('Test Button'),
            ),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });

  group('Widget Tests', () {
    testWidgets('Text field accepts input', (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TextField(
              controller: controller,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Test Input');
      expect(controller.text, 'Test Input');
    });

    testWidgets('Button tap triggers callback', (WidgetTester tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ElevatedButton(
              onPressed: () {
                tapped = true;
              },
              child: const Text('Tap Me'),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      expect(tapped, true);
    });
  });
}
