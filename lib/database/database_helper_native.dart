// database/database_helper_native.dart
//
// Implementação para mobile/desktop: banco Isar.

import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'isar_schema.dart';
import 'frases_data.dart';
import 'seed_data.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Isar? _isar;
  static Future<Isar>? _openFuture;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Isar> get _db async {
    if (_isar != null) return _isar!;
    _openFuture ??= _openAndPrepare();
    return _openFuture!;
  }

  Future<Isar> _openAndPrepare() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [FraseIsarSchema, OrixaIsarSchema],
      directory: dir.path,
    );
    await _seedIfNeeded();
    return _isar!;
  }

  Future<void> _seedIfNeeded() async {
    final isar = _isar!;
    final frases = getFrasesUmbandistas();
    final orixasData = SeedData.getOrixasDataForSeed();
    final fraseCount = await isar.fraseIsars.count();
    final orixaCount = await isar.orixaIsars.count();
    final precisaRepopular =
        fraseCount != frases.length || orixaCount != orixasData.length;

    if (!precisaRepopular) return;

    await isar.writeTxn(() async {
      await isar.fraseIsars.clear();
      await isar.orixaIsars.clear();
    });

    const int chunkSize = 400;
    for (var i = 0; i < frases.length; i += chunkSize) {
      final end = (i + chunkSize < frases.length) ? i + chunkSize : frases.length;
      final chunk = frases
          .sublist(i, end)
          .map((t) => FraseIsar()..texto = t..autor = null)
          .toList();
      await isar.writeTxn(() async {
        await isar.fraseIsars.putAll(chunk);
      });
      await Future<void>.delayed(const Duration(milliseconds: 50));
    }

    final orixaList = orixasData
        .map((m) => OrixaIsar()
          ..nome = m['nome']!
          ..descricao = m['descricao']!
          ..cor = m['cor'])
        .toList();
    await isar.writeTxn(() async {
      await isar.orixaIsars.putAll(orixaList);
    });
  }

  Future<Map<String, dynamic>?> getFraseAleatoria() async {
    final isar = await _db;
    final count = await isar.fraseIsars.count();
    if (count == 0) return null;
    final offset = Random().nextInt(count);
    final list = await isar.fraseIsars.where().offset(offset).limit(1).findAll();
    if (list.isEmpty) return null;
    final f = list.first;
    return {'id': f.id, 'texto': f.texto, 'autor': f.autor};
  }

  Future<List<Map<String, dynamic>>> getAllOrixas() async {
    final isar = await _db;
    final list = await isar.orixaIsars.where().findAll();
    list.sort((a, b) => a.nome.compareTo(b.nome));
    return list
        .map((o) => {
              'id': o.id,
              'nome': o.nome,
              'descricao': o.descricao,
              'cor': o.cor,
            })
        .toList();
  }
}
