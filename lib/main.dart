import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart'; // Asegúrate de tener este archivo creado

void main() {
  runApp(const KidneyAIApp());
}

class KidneyAIApp extends StatelessWidget {
  const KidneyAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KidneyAI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 16)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
