// models/frase.dart
//
// Modelo que representa uma frase do banco (tabela frases).
// Usado pela HomeScreen para exibir a frase aleatória.
// fromMap: converte a linha do SQLite (Map) em objeto Frase.

class Frase {
  final int id;
  final String texto;
  final String? autor;

  Frase({
    required this.id,
    required this.texto,
    this.autor,
  });

  /// Cria um Frase a partir do Map retornado pelo SQLite
  factory Frase.fromMap(Map<String, dynamic> map) {
    return Frase(
      id: map['id'] as int,
      texto: map['texto'] as String,
      autor: map['autor'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'texto': texto,
      'autor': autor,
    };
  }
}
