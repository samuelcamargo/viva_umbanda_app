// database/database_helper_web.dart
//
// Implementação para web: dados em memória (SeedData). Não usa Isar.

import 'dart:math';
import 'seed_data.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Map<String, dynamic>?> getFraseAleatoria() async {
    final list = SeedData.getFrasesForWeb();
    if (list.isEmpty) return null;
    list.shuffle(Random());
    return list.first;
  }

  Future<List<Map<String, dynamic>>> getAllOrixas() async {
    final list = SeedData.getOrixasForWeb();
    list.sort((a, b) => (a['nome'] as String).compareTo(b['nome'] as String));
    return list;
  }
}
