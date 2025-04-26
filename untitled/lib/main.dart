import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Login.dart';
import 'package:untitled/BottomNavScreen.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Check if token exists
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');

  // Run app with the appropriate initial route
  runApp(MyApp(isLoggedIn: token != null && token.isNotEmpty));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // If token exists, go to BottomNavScreen, otherwise go to Login
      home: isLoggedIn ? BottomNavScreen() : Login(),
    );
  }
}