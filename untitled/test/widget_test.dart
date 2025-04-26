import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/main.dart';
import 'package:untitled/Login.dart';
import 'package:untitled/BottomNavScreen.dart';

void main() {
  testWidgets('App should show Login screen when no token exists', (WidgetTester tester) async {
    // Set up SharedPreferences mock with no token
    SharedPreferences.setMockInitialValues({});

    // Build our app and trigger a frame
    await tester.pumpWidget(const MyApp(isLoggedIn: false));
    await tester.pumpAndSettle();

    // Verify that Login screen is shown
    expect(find.byType(Login), findsOneWidget);
    expect(find.byType(BottomNavScreen), findsNothing);

    // Verify login elements are present
    expect(find.byType(TextField), findsAtLeast(1)); // At least one text field
    expect(find.widgetWithText(ElevatedButton, "Login"), findsOneWidget);
  });

  testWidgets('App should show BottomNavScreen when token exists', (WidgetTester tester) async {
    // Build our app with isLoggedIn set to true
    await tester.pumpWidget(const MyApp(isLoggedIn: true));
    await tester.pumpAndSettle();

    // Verify that BottomNavScreen is shown
    expect(find.byType(BottomNavScreen), findsOneWidget);
    expect(find.byType(Login), findsNothing);
  });

  // Add a test for login functionality
  testWidgets('Login should navigate to BottomNavScreen on success', (WidgetTester tester) async {
    // This would require mocking the HTTP response
    // Implementation would depend on your HTTP client and testing approach
  });
}