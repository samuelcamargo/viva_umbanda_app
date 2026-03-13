// database/seed_data.dart
//
// Dados dos Orixás e helpers para web (dados em memória).
// O seed do Isar é feito em DatabaseHelper; as frases vêm de frases_data.dart.

import 'frases_data.dart';

class SeedData {
  /// Usado na web (dados em memória). Mesmo conteúdo das frases do banco.
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
    return getOrixasDataForSeed()
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

  /// Lista de Orixás para seed do Isar (DatabaseHelper) e para getOrixasForWeb.
  static List<Map<String, String>> getOrixasDataForSeed() => _orixasData;

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
}
