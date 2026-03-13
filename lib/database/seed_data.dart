// database/seed_data.dart
//
// Dados iniciais do banco: frases umbandistas e informações dos Orixás.
// Chamado apenas uma vez pelo DatabaseHelper no onCreate.
// As frases vêm de frases_data.dart (mais de 2 mil). Para alterar, edite lá.

import 'package:sqflite/sqflite.dart';
import 'frases_data.dart';

class SeedData {
  /// Insere frases e Orixás só se as tabelas estiverem vazias (evita duplicar)
  static Future<void> insertInitialData(Database db) async {
    await _insertFrases(db);
    await _insertOrixas(db);
  }

  /// Usado na web, onde SQLite não está disponível. Mesmo conteúdo das frases do banco.
  static List<Map<String, dynamic>> getFrasesForWeb() {
    final frases = getFrasesUmbandistas();
    return frases
        .asMap()
        .entries
        .map((e) => {'id': e.key + 1, 'texto': e.value, 'autor': null})
        .toList();
  }

  /// Usado na web. Mesmo conteúdo dos Orixás do banco (id, nome, descricao, cor).
  static List<Map<String, dynamic>> getOrixasForWeb() {
    return _orixasData
        .asMap()
        .entries
        .map((e) => {
              'id': e.key + 1,
              'nome': e.value['nome'],
              'descricao': e.value['descricao'],
              'cor': e.value['cor'],
            })
        .toList();
  }

  static const List<Map<String, String>> _orixasData = [
    {
      'nome': 'Oxalá',
      'descricao':
          'Orixá da criação, da paz e da pureza. Pai maior na Umbanda, representa a luz e o amor divino.',
      'cor': '0xFFFFFFFF',
    },
    {
      'nome': 'Iemanjá',
      'descricao':
          'Rainha das águas, mãe de muitos Orixás. Rege o mar, a maternidade e o acolhimento.',
      'cor': '0xFF4FC3F7',
    },
    {
      'nome': 'Oxum',
      'descricao':
          'Orixá das águas doces, do amor, da fertilidade e da prosperidade. Senhora das cachoeiras.',
      'cor': '0xFFFFD54F',
    },
    {
      'nome': 'Xangô',
      'descricao':
          'Orixá da justiça, do trovão e do fogo. Rei que castiga a mentira e premia a verdade.',
      'cor': '0xFFE53935',
    },
    {
      'nome': 'Ogum',
      'descricao':
          'Orixá guerreiro, abre caminhos. Senhor do ferro, das estradas e da tecnologia.',
      'cor': '0xFF78909C',
    },
    {
      'nome': 'Oxóssi',
      'descricao':
          'Orixá da caça e da mata. Rege a fartura, a sabedoria das florestas e a cura pelas ervas.',
      'cor': '0xFF43A047',
    },
    {
      'nome': 'Iansã',
      'descricao':
          'Orixá dos ventos e das tempestades. Senhora da justiça, da mudança e da coragem.',
      'cor': '0xFFFFAB91',
    },
    {
      'nome': 'Nanã',
      'descricao':
          'Orixá das águas paradas e do barro. Mãe antiga que ensina paciência e respeito ao tempo.',
      'cor': '0xFF7E57C2',
    },
    {
      'nome': 'Omulu/Obaluaê',
      'descricao':
          'Orixá da cura e das doenças. Senhor da terra e da transformação pela dor.',
      'cor': '0xFF5D4037',
    },
    {
      'nome': 'Exu',
      'descricao':
          'Guardião dos caminhos e da comunicação. Mensageiro entre o mundo material e o espiritual.',
      'cor': '0xFF212121',
    },
  ];

  static Future<void> _insertFrases(Database db) async {
    final frases = getFrasesUmbandistas();
    for (var i = 0; i < frases.length; i++) {
      await db.insert(
        'frases',
        {'id': i + 1, 'texto': frases[i], 'autor': null},
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    }
  }

  static Future<void> _insertOrixas(Database db) async {
    for (var i = 0; i < _orixasData.length; i++) {
      final o = _orixasData[i];
      await db.insert(
        'orixas',
        {
          'id': i + 1,
          'nome': o['nome'],
          'descricao': o['descricao'],
          'cor': o['cor'],
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    }
  }
}
