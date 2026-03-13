// database/database_helper.dart
//
// Responsável por abrir/criar o banco SQLite local e expor métodos para
// frases aleatórias e lista de Orixás. Usado por: HomeScreen, OrixasScreen.
// Na web, SQLite não é usado: os dados vêm de SeedData (memória) para evitar travamento.

import 'dart:math';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'seed_data.dart';

class DatabaseHelper {
  // Singleton: uma única instância em todo o app
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  /// Versão do schema; ao aumentar, podemos rodar migrations no onUpgrade
  static const int _version = 1;

  /// Nome do arquivo do banco (fica em getDatabasesPath())
  static const String _dbName = 'viva_umbanda.db';

  /// Retorna a instância do banco, criando/abrindo na primeira vez
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Cria o banco e as tabelas na primeira abertura
  Future<Database> _initDatabase() async {
    final appDir = await getApplicationDocumentsDirectory();
    final path = join(appDir.path, _dbName);

    return openDatabase(
      path,
      version: _version,
      onCreate: _onCreate,
    );
  }

  /// Chamado quando o banco é criado pela primeira vez
  Future<void> _onCreate(Database db, int version) async {
    // Tabela de frases: id, texto e autor (opcional)
    await db.execute('''
      CREATE TABLE frases (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        texto TEXT NOT NULL,
        autor TEXT
      )
    ''');

    // Tabela de Orixás: nome, descrição e cor para a UI
    await db.execute('''
      CREATE TABLE orixas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        descricao TEXT NOT NULL,
        cor TEXT
      )
    ''');

    // Inserir dados iniciais (frases e Orixás)
    await SeedData.insertInitialData(db);
  }

  /// Retorna uma frase aleatória do banco (usado na Home ao abrir o app/aba).
  /// Na web usa dados em memória (SQLite não disponível).
  Future<Map<String, dynamic>?> getFraseAleatoria() async {
    if (kIsWeb) {
      final list = SeedData.getFrasesForWeb();
      if (list.isEmpty) return null;
      list.shuffle(Random());
      return list.first;
    }
    final db = await database;
    final list = await db.rawQuery(
      'SELECT id, texto, autor FROM frases ORDER BY RANDOM() LIMIT 1',
    );
    if (list.isEmpty) return null;
    return list.first;
  }

  /// Retorna todos os Orixás ordenados por nome (usado na tela Orixás).
  /// Na web usa dados em memória.
  Future<List<Map<String, dynamic>>> getAllOrixas() async {
    if (kIsWeb) {
      final list = SeedData.getOrixasForWeb();
      list.sort((a, b) => (a['nome'] as String).compareTo(b['nome'] as String));
      return list;
    }
    final db = await database;
    return db.query('orixas', orderBy: 'nome');
  }
}
