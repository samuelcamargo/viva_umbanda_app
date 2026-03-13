// database/database_helper.dart
//
// Exporta a implementação correta conforme a plataforma:
// Web → dados em memória (database_helper_web.dart).
// Mobile/Desktop → Isar (database_helper_native.dart).
// Assim o schema Isar (.g.dart) não é carregado na web (evita erro de inteiro no JS).

export 'database_helper_web.dart' if (dart.library.io) 'database_helper_native.dart';
