import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const FoodgoApp());
}

class FoodgoApp extends StatelessWidget {
  const FoodgoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodgo Delivery',
      debugShowCheckedModeBanner: false, // Oculamos la etiqueta de debug
      theme: AppTheme.lightTheme,
      home: const SplashScreen(), // Iniciamos con el Splash Screen
    );
  }
}
