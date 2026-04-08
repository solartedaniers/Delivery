import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Definición de colores principales
class AppColors {
  static const Color primary = Color(0xFFEF2A39); // Rojo principal
  static const Color background = Color(0xFFF5F5F8); // Fondo gris claro
  static const Color white = Colors.white;
  static const Color black = Color(0xFF3C2F2F); // Texto oscuro
  static const Color grey = Color(0xFF6A6A6A); // Texto secundario
  static const Color lightGrey = Color(0xFFE5E5E5); // Bordes y separadores
  static const Color orange = Color(0xFFFF9633); // Estrella de calificación
  static const Color darkRed = Color(0xFFC71E2B); // Sombra o variante oscura
  static const Color darkBrown = Color(0xFF3B2E2E); // Botón de "Order Now"
}

// Tema principal de la aplicación
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.black,
        surface: AppColors.white,
      ),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: GoogleFonts.lobster(
          color: AppColors.white,
          fontSize: 48,
        ), // Para el logo principal "Foodgo"
        titleLarge: const TextStyle(
          color: AppColors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: const TextStyle(
          color: AppColors.black,
          fontSize: 16,
        ),
        bodyMedium: const TextStyle(
          color: AppColors.grey,
          fontSize: 14,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
    );
  }
}
