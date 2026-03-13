// app.dart
//
// Configuração do tema global do app (cores, fontes).
// Paleta inspirada em Umbanda: terras, branco, dourado, verde, azul.

import 'package:flutter/material.dart';

/// Cores principais do app (identidade Umbanda)
class AppColors {
  static const Color primary = Color(0xFF5D4037);       // marrom terra
  static const Color primaryLight = Color(0xFF8D6E63);
  static const Color accent = Color(0xFFD4A574);        // dourado/âmbar
  static const Color background = Color(0xFFF5F0E8);    // bege claro
  static const Color surface = Color(0xFFFFFFFF);
  static const Color water = Color(0xFF4FC3F7);         // azul água (Iemanjá)
  static const Color forest = Color(0xFF43A047);        // verde mata (Oxóssi)
}

ThemeData getAppTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.surface,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardTheme(
      color: AppColors.surface,
      elevation: 2,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      bodyLarge: TextStyle(color: Color(0xFF3E2723)),
      bodyMedium: TextStyle(color: Color(0xFF5D4037)),
    ),
  );
}
