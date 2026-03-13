// models/orixa.dart
//
// Modelo que representa um Orixá do banco (tabela orixas).
// Usado pela OrixasScreen para exibir a lista de Orixás.
// fromMap: converte a linha do SQLite em objeto Orixa.
// cor: string no formato "0xAARRGGBB" para usar com Color(int.parse(cor))

class Orixa {
  final int id;
  final String nome;
  final String descricao;
  final String? cor;

  Orixa({
    required this.id,
    required this.nome,
    required this.descricao,
    this.cor,
  });

  factory Orixa.fromMap(Map<String, dynamic> map) {
    return Orixa(
      id: map['id'] as int,
      nome: map['nome'] as String,
      descricao: map['descricao'] as String,
      cor: map['cor'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'cor': cor,
    };
  }
}
