// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFraseIsarCollection on Isar {
  IsarCollection<FraseIsar> get fraseIsars => this.collection();
}

const FraseIsarSchema = CollectionSchema(
  name: r'FraseIsar',
  id: 2925551929999593392,
  properties: {
    r'autor': PropertySchema(
      id: 0,
      name: r'autor',
      type: IsarType.string,
    ),
    r'texto': PropertySchema(
      id: 1,
      name: r'texto',
      type: IsarType.string,
    )
  },
  estimateSize: _fraseIsarEstimateSize,
  serialize: _fraseIsarSerialize,
  deserialize: _fraseIsarDeserialize,
  deserializeProp: _fraseIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _fraseIsarGetId,
  getLinks: _fraseIsarGetLinks,
  attach: _fraseIsarAttach,
  version: '3.1.0+1',
);

int _fraseIsarEstimateSize(
  FraseIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.autor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.texto.length * 3;
  return bytesCount;
}

void _fraseIsarSerialize(
  FraseIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.autor);
  writer.writeString(offsets[1], object.texto);
}

FraseIsar _fraseIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FraseIsar();
  object.autor = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.texto = reader.readString(offsets[1]);
  return object;
}

P _fraseIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _fraseIsarGetId(FraseIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _fraseIsarGetLinks(FraseIsar object) {
  return [];
}

void _fraseIsarAttach(IsarCollection<dynamic> col, Id id, FraseIsar object) {
  object.id = id;
}

extension FraseIsarQueryWhereSort
    on QueryBuilder<FraseIsar, FraseIsar, QWhere> {
  QueryBuilder<FraseIsar, FraseIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FraseIsarQueryWhere
    on QueryBuilder<FraseIsar, FraseIsar, QWhereClause> {
  QueryBuilder<FraseIsar, FraseIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FraseIsarQueryFilter
    on QueryBuilder<FraseIsar, FraseIsar, QFilterCondition> {
  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> autorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'autor',
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> autorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'autor',
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> autorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> autorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'autor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> autorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'autor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> autorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'autor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> autorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'autor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> autorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'autor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> autorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'autor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> autorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'autor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> autorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autor',
        value: '',
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> autorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'autor',
        value: '',
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> textoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'texto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> textoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'texto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> textoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'texto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> textoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'texto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> textoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'texto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> textoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'texto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> textoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'texto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> textoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'texto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> textoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'texto',
        value: '',
      ));
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterFilterCondition> textoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'texto',
        value: '',
      ));
    });
  }
}

extension FraseIsarQueryObject
    on QueryBuilder<FraseIsar, FraseIsar, QFilterCondition> {}

extension FraseIsarQueryLinks
    on QueryBuilder<FraseIsar, FraseIsar, QFilterCondition> {}

extension FraseIsarQuerySortBy on QueryBuilder<FraseIsar, FraseIsar, QSortBy> {
  QueryBuilder<FraseIsar, FraseIsar, QAfterSortBy> sortByAutor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autor', Sort.asc);
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterSortBy> sortByAutorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autor', Sort.desc);
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterSortBy> sortByTexto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'texto', Sort.asc);
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterSortBy> sortByTextoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'texto', Sort.desc);
    });
  }
}

extension FraseIsarQuerySortThenBy
    on QueryBuilder<FraseIsar, FraseIsar, QSortThenBy> {
  QueryBuilder<FraseIsar, FraseIsar, QAfterSortBy> thenByAutor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autor', Sort.asc);
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterSortBy> thenByAutorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autor', Sort.desc);
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterSortBy> thenByTexto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'texto', Sort.asc);
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QAfterSortBy> thenByTextoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'texto', Sort.desc);
    });
  }
}

extension FraseIsarQueryWhereDistinct
    on QueryBuilder<FraseIsar, FraseIsar, QDistinct> {
  QueryBuilder<FraseIsar, FraseIsar, QDistinct> distinctByAutor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FraseIsar, FraseIsar, QDistinct> distinctByTexto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'texto', caseSensitive: caseSensitive);
    });
  }
}

extension FraseIsarQueryProperty
    on QueryBuilder<FraseIsar, FraseIsar, QQueryProperty> {
  QueryBuilder<FraseIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FraseIsar, String?, QQueryOperations> autorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autor');
    });
  }

  QueryBuilder<FraseIsar, String, QQueryOperations> textoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'texto');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOrixaIsarCollection on Isar {
  IsarCollection<OrixaIsar> get orixaIsars => this.collection();
}

const OrixaIsarSchema = CollectionSchema(
  name: r'OrixaIsar',
  id: -442727542478761153,
  properties: {
    r'cor': PropertySchema(
      id: 0,
      name: r'cor',
      type: IsarType.string,
    ),
    r'descricao': PropertySchema(
      id: 1,
      name: r'descricao',
      type: IsarType.string,
    ),
    r'nome': PropertySchema(
      id: 2,
      name: r'nome',
      type: IsarType.string,
    )
  },
  estimateSize: _orixaIsarEstimateSize,
  serialize: _orixaIsarSerialize,
  deserialize: _orixaIsarDeserialize,
  deserializeProp: _orixaIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _orixaIsarGetId,
  getLinks: _orixaIsarGetLinks,
  attach: _orixaIsarAttach,
  version: '3.1.0+1',
);

int _orixaIsarEstimateSize(
  OrixaIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.cor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.descricao.length * 3;
  bytesCount += 3 + object.nome.length * 3;
  return bytesCount;
}

void _orixaIsarSerialize(
  OrixaIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cor);
  writer.writeString(offsets[1], object.descricao);
  writer.writeString(offsets[2], object.nome);
}

OrixaIsar _orixaIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OrixaIsar();
  object.cor = reader.readStringOrNull(offsets[0]);
  object.descricao = reader.readString(offsets[1]);
  object.id = id;
  object.nome = reader.readString(offsets[2]);
  return object;
}

P _orixaIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _orixaIsarGetId(OrixaIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _orixaIsarGetLinks(OrixaIsar object) {
  return [];
}

void _orixaIsarAttach(IsarCollection<dynamic> col, Id id, OrixaIsar object) {
  object.id = id;
}

extension OrixaIsarQueryWhereSort
    on QueryBuilder<OrixaIsar, OrixaIsar, QWhere> {
  QueryBuilder<OrixaIsar, OrixaIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OrixaIsarQueryWhere
    on QueryBuilder<OrixaIsar, OrixaIsar, QWhereClause> {
  QueryBuilder<OrixaIsar, OrixaIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OrixaIsarQueryFilter
    on QueryBuilder<OrixaIsar, OrixaIsar, QFilterCondition> {
  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> corIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cor',
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> corIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cor',
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> corEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> corGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> corLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> corBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> corStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> corEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> corContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> corMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> corIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cor',
        value: '',
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> corIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cor',
        value: '',
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> descricaoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition>
      descricaoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> descricaoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> descricaoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descricao',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> descricaoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> descricaoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> descricaoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> descricaoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descricao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition>
      descricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> nomeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> nomeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> nomeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> nomeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nome',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> nomeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> nomeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> nomeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> nomeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nome',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> nomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome',
        value: '',
      ));
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterFilterCondition> nomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nome',
        value: '',
      ));
    });
  }
}

extension OrixaIsarQueryObject
    on QueryBuilder<OrixaIsar, OrixaIsar, QFilterCondition> {}

extension OrixaIsarQueryLinks
    on QueryBuilder<OrixaIsar, OrixaIsar, QFilterCondition> {}

extension OrixaIsarQuerySortBy on QueryBuilder<OrixaIsar, OrixaIsar, QSortBy> {
  QueryBuilder<OrixaIsar, OrixaIsar, QAfterSortBy> sortByCor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cor', Sort.asc);
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterSortBy> sortByCorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cor', Sort.desc);
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterSortBy> sortByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterSortBy> sortByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterSortBy> sortByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterSortBy> sortByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }
}

extension OrixaIsarQuerySortThenBy
    on QueryBuilder<OrixaIsar, OrixaIsar, QSortThenBy> {
  QueryBuilder<OrixaIsar, OrixaIsar, QAfterSortBy> thenByCor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cor', Sort.asc);
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterSortBy> thenByCorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cor', Sort.desc);
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterSortBy> thenByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterSortBy> thenByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterSortBy> thenByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QAfterSortBy> thenByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }
}

extension OrixaIsarQueryWhereDistinct
    on QueryBuilder<OrixaIsar, OrixaIsar, QDistinct> {
  QueryBuilder<OrixaIsar, OrixaIsar, QDistinct> distinctByCor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QDistinct> distinctByDescricao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descricao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrixaIsar, OrixaIsar, QDistinct> distinctByNome(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nome', caseSensitive: caseSensitive);
    });
  }
}

extension OrixaIsarQueryProperty
    on QueryBuilder<OrixaIsar, OrixaIsar, QQueryProperty> {
  QueryBuilder<OrixaIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OrixaIsar, String?, QQueryOperations> corProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cor');
    });
  }

  QueryBuilder<OrixaIsar, String, QQueryOperations> descricaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descricao');
    });
  }

  QueryBuilder<OrixaIsar, String, QQueryOperations> nomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nome');
    });
  }
}
