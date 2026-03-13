// database/isar_schema.dart
//
// Coleções Isar (substituem as tabelas SQLite).
// Gerar código: dart run build_runner build

import 'package:isar/isar.dart';

part 'isar_schema.g.dart';

@collection
class FraseIsar {
  Id id = Isar.autoIncrement;
  late String texto;
  String? autor;
}

@collection
class OrixaIsar {
  Id id = Isar.autoIncrement;
  late String nome;
  late String descricao;
  String? cor;
}
