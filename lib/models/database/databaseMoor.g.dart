// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'databaseMoor.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DominioDBData extends DataClass implements Insertable<DominioDBData> {
  final int id;
  final String nome;
  final String descricao;
  final String chave;
  final int codigo;
  DominioDBData(
      {@required this.id,
      @required this.nome,
      @required this.descricao,
      @required this.chave,
      @required this.codigo});
  factory DominioDBData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return DominioDBData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      nome: stringType.mapFromDatabaseResponse(data['${effectivePrefix}nome']),
      descricao: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}descricao']),
      chave:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}chave']),
      codigo: intType.mapFromDatabaseResponse(data['${effectivePrefix}codigo']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || nome != null) {
      map['nome'] = Variable<String>(nome);
    }
    if (!nullToAbsent || descricao != null) {
      map['descricao'] = Variable<String>(descricao);
    }
    if (!nullToAbsent || chave != null) {
      map['chave'] = Variable<String>(chave);
    }
    if (!nullToAbsent || codigo != null) {
      map['codigo'] = Variable<int>(codigo);
    }
    return map;
  }

  DominioDBCompanion toCompanion(bool nullToAbsent) {
    return DominioDBCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      nome: nome == null && nullToAbsent ? const Value.absent() : Value(nome),
      descricao: descricao == null && nullToAbsent
          ? const Value.absent()
          : Value(descricao),
      chave:
          chave == null && nullToAbsent ? const Value.absent() : Value(chave),
      codigo:
          codigo == null && nullToAbsent ? const Value.absent() : Value(codigo),
    );
  }

  factory DominioDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DominioDBData(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      descricao: serializer.fromJson<String>(json['descricao']),
      chave: serializer.fromJson<String>(json['chave']),
      codigo: serializer.fromJson<int>(json['codigo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'descricao': serializer.toJson<String>(descricao),
      'chave': serializer.toJson<String>(chave),
      'codigo': serializer.toJson<int>(codigo),
    };
  }

  DominioDBData copyWith(
          {int id, String nome, String descricao, String chave, int codigo}) =>
      DominioDBData(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        descricao: descricao ?? this.descricao,
        chave: chave ?? this.chave,
        codigo: codigo ?? this.codigo,
      );
  @override
  String toString() {
    return (StringBuffer('DominioDBData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('descricao: $descricao, ')
          ..write('chave: $chave, ')
          ..write('codigo: $codigo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(nome.hashCode,
          $mrjc(descricao.hashCode, $mrjc(chave.hashCode, codigo.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DominioDBData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.descricao == this.descricao &&
          other.chave == this.chave &&
          other.codigo == this.codigo);
}

class DominioDBCompanion extends UpdateCompanion<DominioDBData> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String> descricao;
  final Value<String> chave;
  final Value<int> codigo;
  const DominioDBCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.descricao = const Value.absent(),
    this.chave = const Value.absent(),
    this.codigo = const Value.absent(),
  });
  DominioDBCompanion.insert({
    @required int id,
    @required String nome,
    @required String descricao,
    @required String chave,
    @required int codigo,
  })  : id = Value(id),
        nome = Value(nome),
        descricao = Value(descricao),
        chave = Value(chave),
        codigo = Value(codigo);
  static Insertable<DominioDBData> custom({
    Expression<int> id,
    Expression<String> nome,
    Expression<String> descricao,
    Expression<String> chave,
    Expression<int> codigo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (descricao != null) 'descricao': descricao,
      if (chave != null) 'chave': chave,
      if (codigo != null) 'codigo': codigo,
    });
  }

  DominioDBCompanion copyWith(
      {Value<int> id,
      Value<String> nome,
      Value<String> descricao,
      Value<String> chave,
      Value<int> codigo}) {
    return DominioDBCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      chave: chave ?? this.chave,
      codigo: codigo ?? this.codigo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (chave.present) {
      map['chave'] = Variable<String>(chave.value);
    }
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DominioDBCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('descricao: $descricao, ')
          ..write('chave: $chave, ')
          ..write('codigo: $codigo')
          ..write(')'))
        .toString();
  }
}

class $DominioDBTable extends DominioDB
    with TableInfo<$DominioDBTable, DominioDBData> {
  final GeneratedDatabase _db;
  final String _alias;
  $DominioDBTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  GeneratedTextColumn _nome;
  @override
  GeneratedTextColumn get nome => _nome ??= _constructNome();
  GeneratedTextColumn _constructNome() {
    return GeneratedTextColumn(
      'nome',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descricaoMeta = const VerificationMeta('descricao');
  GeneratedTextColumn _descricao;
  @override
  GeneratedTextColumn get descricao => _descricao ??= _constructDescricao();
  GeneratedTextColumn _constructDescricao() {
    return GeneratedTextColumn(
      'descricao',
      $tableName,
      false,
    );
  }

  final VerificationMeta _chaveMeta = const VerificationMeta('chave');
  GeneratedTextColumn _chave;
  @override
  GeneratedTextColumn get chave => _chave ??= _constructChave();
  GeneratedTextColumn _constructChave() {
    return GeneratedTextColumn(
      'chave',
      $tableName,
      false,
    );
  }

  final VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  GeneratedIntColumn _codigo;
  @override
  GeneratedIntColumn get codigo => _codigo ??= _constructCodigo();
  GeneratedIntColumn _constructCodigo() {
    return GeneratedIntColumn(
      'codigo',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, nome, descricao, chave, codigo];
  @override
  $DominioDBTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'dominio_d_b';
  @override
  final String actualTableName = 'dominio_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<DominioDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome'], _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('descricao')) {
      context.handle(_descricaoMeta,
          descricao.isAcceptableOrUnknown(data['descricao'], _descricaoMeta));
    } else if (isInserting) {
      context.missing(_descricaoMeta);
    }
    if (data.containsKey('chave')) {
      context.handle(
          _chaveMeta, chave.isAcceptableOrUnknown(data['chave'], _chaveMeta));
    } else if (isInserting) {
      context.missing(_chaveMeta);
    }
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo'], _codigoMeta));
    } else if (isInserting) {
      context.missing(_codigoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DominioDBData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DominioDBData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DominioDBTable createAlias(String alias) {
    return $DominioDBTable(_db, alias);
  }
}

class BensPatrimoniaisDBData extends DataClass
    implements Insertable<BensPatrimoniaisDBData> {
  final int id;
  final String numeroPatrimonial;
  final String numeroPatrimonialCompleto;
  final String numeroPatrimonialCompletoAntigo;
  final DominioGnt dominioSituacaoFisica;
  final DominioGnt dominioStatus;
  final MaterialGnt material;
  final List<CaracteristicasGnt> caracteristicas;
  final OrganizacaoGnt estruturaOrganizacionalAtual;
  BensPatrimoniaisDBData(
      {@required this.id,
      this.numeroPatrimonial,
      this.numeroPatrimonialCompleto,
      this.numeroPatrimonialCompletoAntigo,
      this.dominioSituacaoFisica,
      this.dominioStatus,
      this.material,
      this.caracteristicas,
      this.estruturaOrganizacionalAtual});
  factory BensPatrimoniaisDBData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return BensPatrimoniaisDBData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      numeroPatrimonial: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}numero_patrimonial']),
      numeroPatrimonialCompleto: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}numero_patrimonial_completo']),
      numeroPatrimonialCompletoAntigo: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}numero_patrimonial_completo_antigo']),
      dominioSituacaoFisica: $BensPatrimoniaisDBTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}dominio_situacao_fisica'])),
      dominioStatus: $BensPatrimoniaisDBTable.$converter1.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}dominio_status'])),
      material: $BensPatrimoniaisDBTable.$converter2.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}material'])),
      caracteristicas: $BensPatrimoniaisDBTable.$converter3.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}caracteristicas'])),
      estruturaOrganizacionalAtual: $BensPatrimoniaisDBTable.$converter4
          .mapToDart(stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}estrutura_organizacional_atual'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || numeroPatrimonial != null) {
      map['numero_patrimonial'] = Variable<String>(numeroPatrimonial);
    }
    if (!nullToAbsent || numeroPatrimonialCompleto != null) {
      map['numero_patrimonial_completo'] =
          Variable<String>(numeroPatrimonialCompleto);
    }
    if (!nullToAbsent || numeroPatrimonialCompletoAntigo != null) {
      map['numero_patrimonial_completo_antigo'] =
          Variable<String>(numeroPatrimonialCompletoAntigo);
    }
    if (!nullToAbsent || dominioSituacaoFisica != null) {
      final converter = $BensPatrimoniaisDBTable.$converter0;
      map['dominio_situacao_fisica'] =
          Variable<String>(converter.mapToSql(dominioSituacaoFisica));
    }
    if (!nullToAbsent || dominioStatus != null) {
      final converter = $BensPatrimoniaisDBTable.$converter1;
      map['dominio_status'] =
          Variable<String>(converter.mapToSql(dominioStatus));
    }
    if (!nullToAbsent || material != null) {
      final converter = $BensPatrimoniaisDBTable.$converter2;
      map['material'] = Variable<String>(converter.mapToSql(material));
    }
    if (!nullToAbsent || caracteristicas != null) {
      final converter = $BensPatrimoniaisDBTable.$converter3;
      map['caracteristicas'] =
          Variable<String>(converter.mapToSql(caracteristicas));
    }
    if (!nullToAbsent || estruturaOrganizacionalAtual != null) {
      final converter = $BensPatrimoniaisDBTable.$converter4;
      map['estrutura_organizacional_atual'] =
          Variable<String>(converter.mapToSql(estruturaOrganizacionalAtual));
    }
    return map;
  }

  BensPatrimoniaisDBCompanion toCompanion(bool nullToAbsent) {
    return BensPatrimoniaisDBCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      numeroPatrimonial: numeroPatrimonial == null && nullToAbsent
          ? const Value.absent()
          : Value(numeroPatrimonial),
      numeroPatrimonialCompleto:
          numeroPatrimonialCompleto == null && nullToAbsent
              ? const Value.absent()
              : Value(numeroPatrimonialCompleto),
      numeroPatrimonialCompletoAntigo:
          numeroPatrimonialCompletoAntigo == null && nullToAbsent
              ? const Value.absent()
              : Value(numeroPatrimonialCompletoAntigo),
      dominioSituacaoFisica: dominioSituacaoFisica == null && nullToAbsent
          ? const Value.absent()
          : Value(dominioSituacaoFisica),
      dominioStatus: dominioStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(dominioStatus),
      material: material == null && nullToAbsent
          ? const Value.absent()
          : Value(material),
      caracteristicas: caracteristicas == null && nullToAbsent
          ? const Value.absent()
          : Value(caracteristicas),
      estruturaOrganizacionalAtual:
          estruturaOrganizacionalAtual == null && nullToAbsent
              ? const Value.absent()
              : Value(estruturaOrganizacionalAtual),
    );
  }

  factory BensPatrimoniaisDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BensPatrimoniaisDBData(
      id: serializer.fromJson<int>(json['id']),
      numeroPatrimonial: serializer.fromJson<String>(json['numeroPatrimonial']),
      numeroPatrimonialCompleto:
          serializer.fromJson<String>(json['numeroPatrimonialCompleto']),
      numeroPatrimonialCompletoAntigo:
          serializer.fromJson<String>(json['numeroPatrimonialCompletoAntigo']),
      dominioSituacaoFisica:
          serializer.fromJson<DominioGnt>(json['dominioSituacaoFisica']),
      dominioStatus: serializer.fromJson<DominioGnt>(json['dominioStatus']),
      material: serializer.fromJson<MaterialGnt>(json['material']),
      caracteristicas: serializer
          .fromJson<List<CaracteristicasGnt>>(json['caracteristicas']),
      estruturaOrganizacionalAtual: serializer
          .fromJson<OrganizacaoGnt>(json['estruturaOrganizacionalAtual']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'numeroPatrimonial': serializer.toJson<String>(numeroPatrimonial),
      'numeroPatrimonialCompleto':
          serializer.toJson<String>(numeroPatrimonialCompleto),
      'numeroPatrimonialCompletoAntigo':
          serializer.toJson<String>(numeroPatrimonialCompletoAntigo),
      'dominioSituacaoFisica':
          serializer.toJson<DominioGnt>(dominioSituacaoFisica),
      'dominioStatus': serializer.toJson<DominioGnt>(dominioStatus),
      'material': serializer.toJson<MaterialGnt>(material),
      'caracteristicas':
          serializer.toJson<List<CaracteristicasGnt>>(caracteristicas),
      'estruturaOrganizacionalAtual':
          serializer.toJson<OrganizacaoGnt>(estruturaOrganizacionalAtual),
    };
  }

  BensPatrimoniaisDBData copyWith(
          {int id,
          String numeroPatrimonial,
          String numeroPatrimonialCompleto,
          String numeroPatrimonialCompletoAntigo,
          DominioGnt dominioSituacaoFisica,
          DominioGnt dominioStatus,
          MaterialGnt material,
          List<CaracteristicasGnt> caracteristicas,
          OrganizacaoGnt estruturaOrganizacionalAtual}) =>
      BensPatrimoniaisDBData(
        id: id ?? this.id,
        numeroPatrimonial: numeroPatrimonial ?? this.numeroPatrimonial,
        numeroPatrimonialCompleto:
            numeroPatrimonialCompleto ?? this.numeroPatrimonialCompleto,
        numeroPatrimonialCompletoAntigo: numeroPatrimonialCompletoAntigo ??
            this.numeroPatrimonialCompletoAntigo,
        dominioSituacaoFisica:
            dominioSituacaoFisica ?? this.dominioSituacaoFisica,
        dominioStatus: dominioStatus ?? this.dominioStatus,
        material: material ?? this.material,
        caracteristicas: caracteristicas ?? this.caracteristicas,
        estruturaOrganizacionalAtual:
            estruturaOrganizacionalAtual ?? this.estruturaOrganizacionalAtual,
      );
  @override
  String toString() {
    return (StringBuffer('BensPatrimoniaisDBData(')
          ..write('id: $id, ')
          ..write('numeroPatrimonial: $numeroPatrimonial, ')
          ..write('numeroPatrimonialCompleto: $numeroPatrimonialCompleto, ')
          ..write(
              'numeroPatrimonialCompletoAntigo: $numeroPatrimonialCompletoAntigo, ')
          ..write('dominioSituacaoFisica: $dominioSituacaoFisica, ')
          ..write('dominioStatus: $dominioStatus, ')
          ..write('material: $material, ')
          ..write('caracteristicas: $caracteristicas, ')
          ..write('estruturaOrganizacionalAtual: $estruturaOrganizacionalAtual')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          numeroPatrimonial.hashCode,
          $mrjc(
              numeroPatrimonialCompleto.hashCode,
              $mrjc(
                  numeroPatrimonialCompletoAntigo.hashCode,
                  $mrjc(
                      dominioSituacaoFisica.hashCode,
                      $mrjc(
                          dominioStatus.hashCode,
                          $mrjc(
                              material.hashCode,
                              $mrjc(
                                  caracteristicas.hashCode,
                                  estruturaOrganizacionalAtual
                                      .hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BensPatrimoniaisDBData &&
          other.id == this.id &&
          other.numeroPatrimonial == this.numeroPatrimonial &&
          other.numeroPatrimonialCompleto == this.numeroPatrimonialCompleto &&
          other.numeroPatrimonialCompletoAntigo ==
              this.numeroPatrimonialCompletoAntigo &&
          other.dominioSituacaoFisica == this.dominioSituacaoFisica &&
          other.dominioStatus == this.dominioStatus &&
          other.material == this.material &&
          other.caracteristicas == this.caracteristicas &&
          other.estruturaOrganizacionalAtual ==
              this.estruturaOrganizacionalAtual);
}

class BensPatrimoniaisDBCompanion
    extends UpdateCompanion<BensPatrimoniaisDBData> {
  final Value<int> id;
  final Value<String> numeroPatrimonial;
  final Value<String> numeroPatrimonialCompleto;
  final Value<String> numeroPatrimonialCompletoAntigo;
  final Value<DominioGnt> dominioSituacaoFisica;
  final Value<DominioGnt> dominioStatus;
  final Value<MaterialGnt> material;
  final Value<List<CaracteristicasGnt>> caracteristicas;
  final Value<OrganizacaoGnt> estruturaOrganizacionalAtual;
  const BensPatrimoniaisDBCompanion({
    this.id = const Value.absent(),
    this.numeroPatrimonial = const Value.absent(),
    this.numeroPatrimonialCompleto = const Value.absent(),
    this.numeroPatrimonialCompletoAntigo = const Value.absent(),
    this.dominioSituacaoFisica = const Value.absent(),
    this.dominioStatus = const Value.absent(),
    this.material = const Value.absent(),
    this.caracteristicas = const Value.absent(),
    this.estruturaOrganizacionalAtual = const Value.absent(),
  });
  BensPatrimoniaisDBCompanion.insert({
    @required int id,
    this.numeroPatrimonial = const Value.absent(),
    this.numeroPatrimonialCompleto = const Value.absent(),
    this.numeroPatrimonialCompletoAntigo = const Value.absent(),
    this.dominioSituacaoFisica = const Value.absent(),
    this.dominioStatus = const Value.absent(),
    this.material = const Value.absent(),
    this.caracteristicas = const Value.absent(),
    this.estruturaOrganizacionalAtual = const Value.absent(),
  }) : id = Value(id);
  static Insertable<BensPatrimoniaisDBData> custom({
    Expression<int> id,
    Expression<String> numeroPatrimonial,
    Expression<String> numeroPatrimonialCompleto,
    Expression<String> numeroPatrimonialCompletoAntigo,
    Expression<String> dominioSituacaoFisica,
    Expression<String> dominioStatus,
    Expression<String> material,
    Expression<String> caracteristicas,
    Expression<String> estruturaOrganizacionalAtual,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (numeroPatrimonial != null) 'numero_patrimonial': numeroPatrimonial,
      if (numeroPatrimonialCompleto != null)
        'numero_patrimonial_completo': numeroPatrimonialCompleto,
      if (numeroPatrimonialCompletoAntigo != null)
        'numero_patrimonial_completo_antigo': numeroPatrimonialCompletoAntigo,
      if (dominioSituacaoFisica != null)
        'dominio_situacao_fisica': dominioSituacaoFisica,
      if (dominioStatus != null) 'dominio_status': dominioStatus,
      if (material != null) 'material': material,
      if (caracteristicas != null) 'caracteristicas': caracteristicas,
      if (estruturaOrganizacionalAtual != null)
        'estrutura_organizacional_atual': estruturaOrganizacionalAtual,
    });
  }

  BensPatrimoniaisDBCompanion copyWith(
      {Value<int> id,
      Value<String> numeroPatrimonial,
      Value<String> numeroPatrimonialCompleto,
      Value<String> numeroPatrimonialCompletoAntigo,
      Value<DominioGnt> dominioSituacaoFisica,
      Value<DominioGnt> dominioStatus,
      Value<MaterialGnt> material,
      Value<List<CaracteristicasGnt>> caracteristicas,
      Value<OrganizacaoGnt> estruturaOrganizacionalAtual}) {
    return BensPatrimoniaisDBCompanion(
      id: id ?? this.id,
      numeroPatrimonial: numeroPatrimonial ?? this.numeroPatrimonial,
      numeroPatrimonialCompleto:
          numeroPatrimonialCompleto ?? this.numeroPatrimonialCompleto,
      numeroPatrimonialCompletoAntigo: numeroPatrimonialCompletoAntigo ??
          this.numeroPatrimonialCompletoAntigo,
      dominioSituacaoFisica:
          dominioSituacaoFisica ?? this.dominioSituacaoFisica,
      dominioStatus: dominioStatus ?? this.dominioStatus,
      material: material ?? this.material,
      caracteristicas: caracteristicas ?? this.caracteristicas,
      estruturaOrganizacionalAtual:
          estruturaOrganizacionalAtual ?? this.estruturaOrganizacionalAtual,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (numeroPatrimonial.present) {
      map['numero_patrimonial'] = Variable<String>(numeroPatrimonial.value);
    }
    if (numeroPatrimonialCompleto.present) {
      map['numero_patrimonial_completo'] =
          Variable<String>(numeroPatrimonialCompleto.value);
    }
    if (numeroPatrimonialCompletoAntigo.present) {
      map['numero_patrimonial_completo_antigo'] =
          Variable<String>(numeroPatrimonialCompletoAntigo.value);
    }
    if (dominioSituacaoFisica.present) {
      final converter = $BensPatrimoniaisDBTable.$converter0;
      map['dominio_situacao_fisica'] =
          Variable<String>(converter.mapToSql(dominioSituacaoFisica.value));
    }
    if (dominioStatus.present) {
      final converter = $BensPatrimoniaisDBTable.$converter1;
      map['dominio_status'] =
          Variable<String>(converter.mapToSql(dominioStatus.value));
    }
    if (material.present) {
      final converter = $BensPatrimoniaisDBTable.$converter2;
      map['material'] = Variable<String>(converter.mapToSql(material.value));
    }
    if (caracteristicas.present) {
      final converter = $BensPatrimoniaisDBTable.$converter3;
      map['caracteristicas'] =
          Variable<String>(converter.mapToSql(caracteristicas.value));
    }
    if (estruturaOrganizacionalAtual.present) {
      final converter = $BensPatrimoniaisDBTable.$converter4;
      map['estrutura_organizacional_atual'] = Variable<String>(
          converter.mapToSql(estruturaOrganizacionalAtual.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BensPatrimoniaisDBCompanion(')
          ..write('id: $id, ')
          ..write('numeroPatrimonial: $numeroPatrimonial, ')
          ..write('numeroPatrimonialCompleto: $numeroPatrimonialCompleto, ')
          ..write(
              'numeroPatrimonialCompletoAntigo: $numeroPatrimonialCompletoAntigo, ')
          ..write('dominioSituacaoFisica: $dominioSituacaoFisica, ')
          ..write('dominioStatus: $dominioStatus, ')
          ..write('material: $material, ')
          ..write('caracteristicas: $caracteristicas, ')
          ..write('estruturaOrganizacionalAtual: $estruturaOrganizacionalAtual')
          ..write(')'))
        .toString();
  }
}

class $BensPatrimoniaisDBTable extends BensPatrimoniaisDB
    with TableInfo<$BensPatrimoniaisDBTable, BensPatrimoniaisDBData> {
  final GeneratedDatabase _db;
  final String _alias;
  $BensPatrimoniaisDBTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _numeroPatrimonialMeta =
      const VerificationMeta('numeroPatrimonial');
  GeneratedTextColumn _numeroPatrimonial;
  @override
  GeneratedTextColumn get numeroPatrimonial =>
      _numeroPatrimonial ??= _constructNumeroPatrimonial();
  GeneratedTextColumn _constructNumeroPatrimonial() {
    return GeneratedTextColumn(
      'numero_patrimonial',
      $tableName,
      true,
    );
  }

  final VerificationMeta _numeroPatrimonialCompletoMeta =
      const VerificationMeta('numeroPatrimonialCompleto');
  GeneratedTextColumn _numeroPatrimonialCompleto;
  @override
  GeneratedTextColumn get numeroPatrimonialCompleto =>
      _numeroPatrimonialCompleto ??= _constructNumeroPatrimonialCompleto();
  GeneratedTextColumn _constructNumeroPatrimonialCompleto() {
    return GeneratedTextColumn(
      'numero_patrimonial_completo',
      $tableName,
      true,
    );
  }

  final VerificationMeta _numeroPatrimonialCompletoAntigoMeta =
      const VerificationMeta('numeroPatrimonialCompletoAntigo');
  GeneratedTextColumn _numeroPatrimonialCompletoAntigo;
  @override
  GeneratedTextColumn get numeroPatrimonialCompletoAntigo =>
      _numeroPatrimonialCompletoAntigo ??=
          _constructNumeroPatrimonialCompletoAntigo();
  GeneratedTextColumn _constructNumeroPatrimonialCompletoAntigo() {
    return GeneratedTextColumn(
      'numero_patrimonial_completo_antigo',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dominioSituacaoFisicaMeta =
      const VerificationMeta('dominioSituacaoFisica');
  GeneratedTextColumn _dominioSituacaoFisica;
  @override
  GeneratedTextColumn get dominioSituacaoFisica =>
      _dominioSituacaoFisica ??= _constructDominioSituacaoFisica();
  GeneratedTextColumn _constructDominioSituacaoFisica() {
    return GeneratedTextColumn(
      'dominio_situacao_fisica',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dominioStatusMeta =
      const VerificationMeta('dominioStatus');
  GeneratedTextColumn _dominioStatus;
  @override
  GeneratedTextColumn get dominioStatus =>
      _dominioStatus ??= _constructDominioStatus();
  GeneratedTextColumn _constructDominioStatus() {
    return GeneratedTextColumn(
      'dominio_status',
      $tableName,
      true,
    );
  }

  final VerificationMeta _materialMeta = const VerificationMeta('material');
  GeneratedTextColumn _material;
  @override
  GeneratedTextColumn get material => _material ??= _constructMaterial();
  GeneratedTextColumn _constructMaterial() {
    return GeneratedTextColumn(
      'material',
      $tableName,
      true,
    );
  }

  final VerificationMeta _caracteristicasMeta =
      const VerificationMeta('caracteristicas');
  GeneratedTextColumn _caracteristicas;
  @override
  GeneratedTextColumn get caracteristicas =>
      _caracteristicas ??= _constructCaracteristicas();
  GeneratedTextColumn _constructCaracteristicas() {
    return GeneratedTextColumn(
      'caracteristicas',
      $tableName,
      true,
    );
  }

  final VerificationMeta _estruturaOrganizacionalAtualMeta =
      const VerificationMeta('estruturaOrganizacionalAtual');
  GeneratedTextColumn _estruturaOrganizacionalAtual;
  @override
  GeneratedTextColumn get estruturaOrganizacionalAtual =>
      _estruturaOrganizacionalAtual ??=
          _constructEstruturaOrganizacionalAtual();
  GeneratedTextColumn _constructEstruturaOrganizacionalAtual() {
    return GeneratedTextColumn(
      'estrutura_organizacional_atual',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        numeroPatrimonial,
        numeroPatrimonialCompleto,
        numeroPatrimonialCompletoAntigo,
        dominioSituacaoFisica,
        dominioStatus,
        material,
        caracteristicas,
        estruturaOrganizacionalAtual
      ];
  @override
  $BensPatrimoniaisDBTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'bens_patrimoniais_d_b';
  @override
  final String actualTableName = 'bens_patrimoniais_d_b';
  @override
  VerificationContext validateIntegrity(
      Insertable<BensPatrimoniaisDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('numero_patrimonial')) {
      context.handle(
          _numeroPatrimonialMeta,
          numeroPatrimonial.isAcceptableOrUnknown(
              data['numero_patrimonial'], _numeroPatrimonialMeta));
    }
    if (data.containsKey('numero_patrimonial_completo')) {
      context.handle(
          _numeroPatrimonialCompletoMeta,
          numeroPatrimonialCompleto.isAcceptableOrUnknown(
              data['numero_patrimonial_completo'],
              _numeroPatrimonialCompletoMeta));
    }
    if (data.containsKey('numero_patrimonial_completo_antigo')) {
      context.handle(
          _numeroPatrimonialCompletoAntigoMeta,
          numeroPatrimonialCompletoAntigo.isAcceptableOrUnknown(
              data['numero_patrimonial_completo_antigo'],
              _numeroPatrimonialCompletoAntigoMeta));
    }
    context.handle(
        _dominioSituacaoFisicaMeta, const VerificationResult.success());
    context.handle(_dominioStatusMeta, const VerificationResult.success());
    context.handle(_materialMeta, const VerificationResult.success());
    context.handle(_caracteristicasMeta, const VerificationResult.success());
    context.handle(
        _estruturaOrganizacionalAtualMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  BensPatrimoniaisDBData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BensPatrimoniaisDBData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BensPatrimoniaisDBTable createAlias(String alias) {
    return $BensPatrimoniaisDBTable(_db, alias);
  }

  static TypeConverter<DominioGnt, String> $converter0 =
      const DominioConverter();
  static TypeConverter<DominioGnt, String> $converter1 =
      const DominioConverter();
  static TypeConverter<MaterialGnt, String> $converter2 =
      const MaterialConverter();
  static TypeConverter<List<CaracteristicasGnt>, String> $converter3 =
      const CaracteristicasConverter();
  static TypeConverter<OrganizacaoGnt, String> $converter4 =
      const OrganizacaoConverter();
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DominioDBTable _dominioDB;
  $DominioDBTable get dominioDB => _dominioDB ??= $DominioDBTable(this);
  $BensPatrimoniaisDBTable _bensPatrimoniaisDB;
  $BensPatrimoniaisDBTable get bensPatrimoniaisDB =>
      _bensPatrimoniaisDB ??= $BensPatrimoniaisDBTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [dominioDB, bensPatrimoniaisDB];
}
