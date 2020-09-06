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
  final Dominio dominioSituacaoFisica;
  final Dominio dominioStatus;
  final Material material;
  final List<Caracteristicas> caracteristicas;
  final Organizacao estruturaOrganizacionalAtual;
  final DadosBensPatrimoniais dadosBensPatrimoniais;
  final bool inventariado;
  BensPatrimoniaisDBData(
      {@required this.id,
      this.numeroPatrimonial,
      this.numeroPatrimonialCompleto,
      this.numeroPatrimonialCompletoAntigo,
      this.dominioSituacaoFisica,
      this.dominioStatus,
      this.material,
      this.caracteristicas,
      this.estruturaOrganizacionalAtual,
      this.dadosBensPatrimoniais,
      @required this.inventariado});
  factory BensPatrimoniaisDBData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
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
      dadosBensPatrimoniais: $BensPatrimoniaisDBTable.$converter5.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}dados_bens_patrimoniais'])),
      inventariado: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}inventariado']),
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
    if (!nullToAbsent || dadosBensPatrimoniais != null) {
      final converter = $BensPatrimoniaisDBTable.$converter5;
      map['dados_bens_patrimoniais'] =
          Variable<String>(converter.mapToSql(dadosBensPatrimoniais));
    }
    if (!nullToAbsent || inventariado != null) {
      map['inventariado'] = Variable<bool>(inventariado);
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
      dadosBensPatrimoniais: dadosBensPatrimoniais == null && nullToAbsent
          ? const Value.absent()
          : Value(dadosBensPatrimoniais),
      inventariado: inventariado == null && nullToAbsent
          ? const Value.absent()
          : Value(inventariado),
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
          serializer.fromJson<Dominio>(json['dominioSituacaoFisica']),
      dominioStatus: serializer.fromJson<Dominio>(json['dominioStatus']),
      material: serializer.fromJson<Material>(json['material']),
      caracteristicas:
          serializer.fromJson<List<Caracteristicas>>(json['caracteristicas']),
      estruturaOrganizacionalAtual: serializer
          .fromJson<Organizacao>(json['estruturaOrganizacionalAtual']),
      dadosBensPatrimoniais: serializer
          .fromJson<DadosBensPatrimoniais>(json['dadosBensPatrimoniais']),
      inventariado: serializer.fromJson<bool>(json['inventariado']),
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
          serializer.toJson<Dominio>(dominioSituacaoFisica),
      'dominioStatus': serializer.toJson<Dominio>(dominioStatus),
      'material': serializer.toJson<Material>(material),
      'caracteristicas':
          serializer.toJson<List<Caracteristicas>>(caracteristicas),
      'estruturaOrganizacionalAtual':
          serializer.toJson<Organizacao>(estruturaOrganizacionalAtual),
      'dadosBensPatrimoniais':
          serializer.toJson<DadosBensPatrimoniais>(dadosBensPatrimoniais),
      'inventariado': serializer.toJson<bool>(inventariado),
    };
  }

  BensPatrimoniaisDBData copyWith(
          {int id,
          String numeroPatrimonial,
          String numeroPatrimonialCompleto,
          String numeroPatrimonialCompletoAntigo,
          Dominio dominioSituacaoFisica,
          Dominio dominioStatus,
          Material material,
          List<Caracteristicas> caracteristicas,
          Organizacao estruturaOrganizacionalAtual,
          DadosBensPatrimoniais dadosBensPatrimoniais,
          bool inventariado}) =>
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
        dadosBensPatrimoniais:
            dadosBensPatrimoniais ?? this.dadosBensPatrimoniais,
        inventariado: inventariado ?? this.inventariado,
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
          ..write(
              'estruturaOrganizacionalAtual: $estruturaOrganizacionalAtual, ')
          ..write('dadosBensPatrimoniais: $dadosBensPatrimoniais, ')
          ..write('inventariado: $inventariado')
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
                                  $mrjc(
                                      estruturaOrganizacionalAtual.hashCode,
                                      $mrjc(dadosBensPatrimoniais.hashCode,
                                          inventariado.hashCode)))))))))));
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
              this.estruturaOrganizacionalAtual &&
          other.dadosBensPatrimoniais == this.dadosBensPatrimoniais &&
          other.inventariado == this.inventariado);
}

class BensPatrimoniaisDBCompanion
    extends UpdateCompanion<BensPatrimoniaisDBData> {
  final Value<int> id;
  final Value<String> numeroPatrimonial;
  final Value<String> numeroPatrimonialCompleto;
  final Value<String> numeroPatrimonialCompletoAntigo;
  final Value<Dominio> dominioSituacaoFisica;
  final Value<Dominio> dominioStatus;
  final Value<Material> material;
  final Value<List<Caracteristicas>> caracteristicas;
  final Value<Organizacao> estruturaOrganizacionalAtual;
  final Value<DadosBensPatrimoniais> dadosBensPatrimoniais;
  final Value<bool> inventariado;
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
    this.dadosBensPatrimoniais = const Value.absent(),
    this.inventariado = const Value.absent(),
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
    this.dadosBensPatrimoniais = const Value.absent(),
    this.inventariado = const Value.absent(),
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
    Expression<String> dadosBensPatrimoniais,
    Expression<bool> inventariado,
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
      if (dadosBensPatrimoniais != null)
        'dados_bens_patrimoniais': dadosBensPatrimoniais,
      if (inventariado != null) 'inventariado': inventariado,
    });
  }

  BensPatrimoniaisDBCompanion copyWith(
      {Value<int> id,
      Value<String> numeroPatrimonial,
      Value<String> numeroPatrimonialCompleto,
      Value<String> numeroPatrimonialCompletoAntigo,
      Value<Dominio> dominioSituacaoFisica,
      Value<Dominio> dominioStatus,
      Value<Material> material,
      Value<List<Caracteristicas>> caracteristicas,
      Value<Organizacao> estruturaOrganizacionalAtual,
      Value<DadosBensPatrimoniais> dadosBensPatrimoniais,
      Value<bool> inventariado}) {
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
      dadosBensPatrimoniais:
          dadosBensPatrimoniais ?? this.dadosBensPatrimoniais,
      inventariado: inventariado ?? this.inventariado,
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
    if (dadosBensPatrimoniais.present) {
      final converter = $BensPatrimoniaisDBTable.$converter5;
      map['dados_bens_patrimoniais'] =
          Variable<String>(converter.mapToSql(dadosBensPatrimoniais.value));
    }
    if (inventariado.present) {
      map['inventariado'] = Variable<bool>(inventariado.value);
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
          ..write(
              'estruturaOrganizacionalAtual: $estruturaOrganizacionalAtual, ')
          ..write('dadosBensPatrimoniais: $dadosBensPatrimoniais, ')
          ..write('inventariado: $inventariado')
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

  final VerificationMeta _dadosBensPatrimoniaisMeta =
      const VerificationMeta('dadosBensPatrimoniais');
  GeneratedTextColumn _dadosBensPatrimoniais;
  @override
  GeneratedTextColumn get dadosBensPatrimoniais =>
      _dadosBensPatrimoniais ??= _constructDadosBensPatrimoniais();
  GeneratedTextColumn _constructDadosBensPatrimoniais() {
    return GeneratedTextColumn(
      'dados_bens_patrimoniais',
      $tableName,
      true,
    );
  }

  final VerificationMeta _inventariadoMeta =
      const VerificationMeta('inventariado');
  GeneratedBoolColumn _inventariado;
  @override
  GeneratedBoolColumn get inventariado =>
      _inventariado ??= _constructInventariado();
  GeneratedBoolColumn _constructInventariado() {
    return GeneratedBoolColumn('inventariado', $tableName, false,
        defaultValue: const Constant(false));
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
        estruturaOrganizacionalAtual,
        dadosBensPatrimoniais,
        inventariado
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
    context.handle(
        _dadosBensPatrimoniaisMeta, const VerificationResult.success());
    if (data.containsKey('inventariado')) {
      context.handle(
          _inventariadoMeta,
          inventariado.isAcceptableOrUnknown(
              data['inventariado'], _inventariadoMeta));
    }
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

  static TypeConverter<Dominio, String> $converter0 = const DominioConverter();
  static TypeConverter<Dominio, String> $converter1 = const DominioConverter();
  static TypeConverter<Material, String> $converter2 =
      const MaterialConverter();
  static TypeConverter<List<Caracteristicas>, String> $converter3 =
      const CaracteristicasConverter();
  static TypeConverter<Organizacao, String> $converter4 =
      const OrganizacaoConverter();
  static TypeConverter<DadosBensPatrimoniais, String> $converter5 =
      const BemPatrimonialDadosConverter();
}

class EstruturaInventarioDBData extends DataClass
    implements Insertable<EstruturaInventarioDBData> {
  final int id;
  final int idInventario;
  final Dominio dominioStatusInventarioEstrutura;
  final Organizacao estruturaOrganizacional;
  EstruturaInventarioDBData(
      {@required this.id,
      this.idInventario,
      this.dominioStatusInventarioEstrutura,
      this.estruturaOrganizacional});
  factory EstruturaInventarioDBData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return EstruturaInventarioDBData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idInventario: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_inventario']),
      dominioStatusInventarioEstrutura: $EstruturaInventarioDBTable.$converter0
          .mapToDart(stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}dominio_status_inventario_estrutura'])),
      estruturaOrganizacional: $EstruturaInventarioDBTable.$converter1
          .mapToDart(stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}estrutura_organizacional'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idInventario != null) {
      map['id_inventario'] = Variable<int>(idInventario);
    }
    if (!nullToAbsent || dominioStatusInventarioEstrutura != null) {
      final converter = $EstruturaInventarioDBTable.$converter0;
      map['dominio_status_inventario_estrutura'] = Variable<String>(
          converter.mapToSql(dominioStatusInventarioEstrutura));
    }
    if (!nullToAbsent || estruturaOrganizacional != null) {
      final converter = $EstruturaInventarioDBTable.$converter1;
      map['estrutura_organizacional'] =
          Variable<String>(converter.mapToSql(estruturaOrganizacional));
    }
    return map;
  }

  EstruturaInventarioDBCompanion toCompanion(bool nullToAbsent) {
    return EstruturaInventarioDBCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idInventario: idInventario == null && nullToAbsent
          ? const Value.absent()
          : Value(idInventario),
      dominioStatusInventarioEstrutura:
          dominioStatusInventarioEstrutura == null && nullToAbsent
              ? const Value.absent()
              : Value(dominioStatusInventarioEstrutura),
      estruturaOrganizacional: estruturaOrganizacional == null && nullToAbsent
          ? const Value.absent()
          : Value(estruturaOrganizacional),
    );
  }

  factory EstruturaInventarioDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return EstruturaInventarioDBData(
      id: serializer.fromJson<int>(json['id']),
      idInventario: serializer.fromJson<int>(json['idInventario']),
      dominioStatusInventarioEstrutura: serializer
          .fromJson<Dominio>(json['dominioStatusInventarioEstrutura']),
      estruturaOrganizacional:
          serializer.fromJson<Organizacao>(json['estruturaOrganizacional']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idInventario': serializer.toJson<int>(idInventario),
      'dominioStatusInventarioEstrutura':
          serializer.toJson<Dominio>(dominioStatusInventarioEstrutura),
      'estruturaOrganizacional':
          serializer.toJson<Organizacao>(estruturaOrganizacional),
    };
  }

  EstruturaInventarioDBData copyWith(
          {int id,
          int idInventario,
          Dominio dominioStatusInventarioEstrutura,
          Organizacao estruturaOrganizacional}) =>
      EstruturaInventarioDBData(
        id: id ?? this.id,
        idInventario: idInventario ?? this.idInventario,
        dominioStatusInventarioEstrutura: dominioStatusInventarioEstrutura ??
            this.dominioStatusInventarioEstrutura,
        estruturaOrganizacional:
            estruturaOrganizacional ?? this.estruturaOrganizacional,
      );
  @override
  String toString() {
    return (StringBuffer('EstruturaInventarioDBData(')
          ..write('id: $id, ')
          ..write('idInventario: $idInventario, ')
          ..write(
              'dominioStatusInventarioEstrutura: $dominioStatusInventarioEstrutura, ')
          ..write('estruturaOrganizacional: $estruturaOrganizacional')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idInventario.hashCode,
          $mrjc(dominioStatusInventarioEstrutura.hashCode,
              estruturaOrganizacional.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is EstruturaInventarioDBData &&
          other.id == this.id &&
          other.idInventario == this.idInventario &&
          other.dominioStatusInventarioEstrutura ==
              this.dominioStatusInventarioEstrutura &&
          other.estruturaOrganizacional == this.estruturaOrganizacional);
}

class EstruturaInventarioDBCompanion
    extends UpdateCompanion<EstruturaInventarioDBData> {
  final Value<int> id;
  final Value<int> idInventario;
  final Value<Dominio> dominioStatusInventarioEstrutura;
  final Value<Organizacao> estruturaOrganizacional;
  const EstruturaInventarioDBCompanion({
    this.id = const Value.absent(),
    this.idInventario = const Value.absent(),
    this.dominioStatusInventarioEstrutura = const Value.absent(),
    this.estruturaOrganizacional = const Value.absent(),
  });
  EstruturaInventarioDBCompanion.insert({
    @required int id,
    this.idInventario = const Value.absent(),
    this.dominioStatusInventarioEstrutura = const Value.absent(),
    this.estruturaOrganizacional = const Value.absent(),
  }) : id = Value(id);
  static Insertable<EstruturaInventarioDBData> custom({
    Expression<int> id,
    Expression<int> idInventario,
    Expression<String> dominioStatusInventarioEstrutura,
    Expression<String> estruturaOrganizacional,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idInventario != null) 'id_inventario': idInventario,
      if (dominioStatusInventarioEstrutura != null)
        'dominio_status_inventario_estrutura': dominioStatusInventarioEstrutura,
      if (estruturaOrganizacional != null)
        'estrutura_organizacional': estruturaOrganizacional,
    });
  }

  EstruturaInventarioDBCompanion copyWith(
      {Value<int> id,
      Value<int> idInventario,
      Value<Dominio> dominioStatusInventarioEstrutura,
      Value<Organizacao> estruturaOrganizacional}) {
    return EstruturaInventarioDBCompanion(
      id: id ?? this.id,
      idInventario: idInventario ?? this.idInventario,
      dominioStatusInventarioEstrutura: dominioStatusInventarioEstrutura ??
          this.dominioStatusInventarioEstrutura,
      estruturaOrganizacional:
          estruturaOrganizacional ?? this.estruturaOrganizacional,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idInventario.present) {
      map['id_inventario'] = Variable<int>(idInventario.value);
    }
    if (dominioStatusInventarioEstrutura.present) {
      final converter = $EstruturaInventarioDBTable.$converter0;
      map['dominio_status_inventario_estrutura'] = Variable<String>(
          converter.mapToSql(dominioStatusInventarioEstrutura.value));
    }
    if (estruturaOrganizacional.present) {
      final converter = $EstruturaInventarioDBTable.$converter1;
      map['estrutura_organizacional'] =
          Variable<String>(converter.mapToSql(estruturaOrganizacional.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EstruturaInventarioDBCompanion(')
          ..write('id: $id, ')
          ..write('idInventario: $idInventario, ')
          ..write(
              'dominioStatusInventarioEstrutura: $dominioStatusInventarioEstrutura, ')
          ..write('estruturaOrganizacional: $estruturaOrganizacional')
          ..write(')'))
        .toString();
  }
}

class $EstruturaInventarioDBTable extends EstruturaInventarioDB
    with TableInfo<$EstruturaInventarioDBTable, EstruturaInventarioDBData> {
  final GeneratedDatabase _db;
  final String _alias;
  $EstruturaInventarioDBTable(this._db, [this._alias]);
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

  final VerificationMeta _idInventarioMeta =
      const VerificationMeta('idInventario');
  GeneratedIntColumn _idInventario;
  @override
  GeneratedIntColumn get idInventario =>
      _idInventario ??= _constructIdInventario();
  GeneratedIntColumn _constructIdInventario() {
    return GeneratedIntColumn(
      'id_inventario',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dominioStatusInventarioEstruturaMeta =
      const VerificationMeta('dominioStatusInventarioEstrutura');
  GeneratedTextColumn _dominioStatusInventarioEstrutura;
  @override
  GeneratedTextColumn get dominioStatusInventarioEstrutura =>
      _dominioStatusInventarioEstrutura ??=
          _constructDominioStatusInventarioEstrutura();
  GeneratedTextColumn _constructDominioStatusInventarioEstrutura() {
    return GeneratedTextColumn(
      'dominio_status_inventario_estrutura',
      $tableName,
      true,
    );
  }

  final VerificationMeta _estruturaOrganizacionalMeta =
      const VerificationMeta('estruturaOrganizacional');
  GeneratedTextColumn _estruturaOrganizacional;
  @override
  GeneratedTextColumn get estruturaOrganizacional =>
      _estruturaOrganizacional ??= _constructEstruturaOrganizacional();
  GeneratedTextColumn _constructEstruturaOrganizacional() {
    return GeneratedTextColumn(
      'estrutura_organizacional',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        idInventario,
        dominioStatusInventarioEstrutura,
        estruturaOrganizacional
      ];
  @override
  $EstruturaInventarioDBTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'estrutura_inventario_d_b';
  @override
  final String actualTableName = 'estrutura_inventario_d_b';
  @override
  VerificationContext validateIntegrity(
      Insertable<EstruturaInventarioDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('id_inventario')) {
      context.handle(
          _idInventarioMeta,
          idInventario.isAcceptableOrUnknown(
              data['id_inventario'], _idInventarioMeta));
    }
    context.handle(_dominioStatusInventarioEstruturaMeta,
        const VerificationResult.success());
    context.handle(
        _estruturaOrganizacionalMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  EstruturaInventarioDBData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return EstruturaInventarioDBData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  $EstruturaInventarioDBTable createAlias(String alias) {
    return $EstruturaInventarioDBTable(_db, alias);
  }

  static TypeConverter<Dominio, String> $converter0 = const DominioConverter();
  static TypeConverter<Organizacao, String> $converter1 =
      const OrganizacaoConverter();
}

class LevantamentoDBData extends DataClass
    implements Insertable<LevantamentoDBData> {
  final int id;
  final int idOrganizacao;
  final String nome;
  final String codigoENome;
  final String codigo;
  final Dominio dominioTipoInventario;
  final Dominio dominioStatusInventario;
  final int quantidadeEstruturas;
  final int quantidadeTotalBens;
  final int quantidadeTotalBensTratados;
  final int quantidadeTotalBensEmInconsistencia;
  final int quantidadeTotalBensSemInconsistencia;
  final int quantidadeTotalBensBaixados;
  LevantamentoDBData(
      {@required this.id,
      this.idOrganizacao,
      this.nome,
      this.codigoENome,
      this.codigo,
      this.dominioTipoInventario,
      this.dominioStatusInventario,
      this.quantidadeEstruturas,
      this.quantidadeTotalBens,
      this.quantidadeTotalBensTratados,
      this.quantidadeTotalBensEmInconsistencia,
      this.quantidadeTotalBensSemInconsistencia,
      this.quantidadeTotalBensBaixados});
  factory LevantamentoDBData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return LevantamentoDBData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idOrganizacao: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_organizacao']),
      nome: stringType.mapFromDatabaseResponse(data['${effectivePrefix}nome']),
      codigoENome: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}codigo_e_nome']),
      codigo:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}codigo']),
      dominioTipoInventario: $LevantamentoDBTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}dominio_tipo_inventario'])),
      dominioStatusInventario: $LevantamentoDBTable.$converter1.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}dominio_status_inventario'])),
      quantidadeEstruturas: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}quantidade_estruturas']),
      quantidadeTotalBens: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}quantidade_total_bens']),
      quantidadeTotalBensTratados: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}quantidade_total_bens_tratados']),
      quantidadeTotalBensEmInconsistencia: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}quantidade_total_bens_em_inconsistencia']),
      quantidadeTotalBensSemInconsistencia: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}quantidade_total_bens_sem_inconsistencia']),
      quantidadeTotalBensBaixados: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}quantidade_total_bens_baixados']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idOrganizacao != null) {
      map['id_organizacao'] = Variable<int>(idOrganizacao);
    }
    if (!nullToAbsent || nome != null) {
      map['nome'] = Variable<String>(nome);
    }
    if (!nullToAbsent || codigoENome != null) {
      map['codigo_e_nome'] = Variable<String>(codigoENome);
    }
    if (!nullToAbsent || codigo != null) {
      map['codigo'] = Variable<String>(codigo);
    }
    if (!nullToAbsent || dominioTipoInventario != null) {
      final converter = $LevantamentoDBTable.$converter0;
      map['dominio_tipo_inventario'] =
          Variable<String>(converter.mapToSql(dominioTipoInventario));
    }
    if (!nullToAbsent || dominioStatusInventario != null) {
      final converter = $LevantamentoDBTable.$converter1;
      map['dominio_status_inventario'] =
          Variable<String>(converter.mapToSql(dominioStatusInventario));
    }
    if (!nullToAbsent || quantidadeEstruturas != null) {
      map['quantidade_estruturas'] = Variable<int>(quantidadeEstruturas);
    }
    if (!nullToAbsent || quantidadeTotalBens != null) {
      map['quantidade_total_bens'] = Variable<int>(quantidadeTotalBens);
    }
    if (!nullToAbsent || quantidadeTotalBensTratados != null) {
      map['quantidade_total_bens_tratados'] =
          Variable<int>(quantidadeTotalBensTratados);
    }
    if (!nullToAbsent || quantidadeTotalBensEmInconsistencia != null) {
      map['quantidade_total_bens_em_inconsistencia'] =
          Variable<int>(quantidadeTotalBensEmInconsistencia);
    }
    if (!nullToAbsent || quantidadeTotalBensSemInconsistencia != null) {
      map['quantidade_total_bens_sem_inconsistencia'] =
          Variable<int>(quantidadeTotalBensSemInconsistencia);
    }
    if (!nullToAbsent || quantidadeTotalBensBaixados != null) {
      map['quantidade_total_bens_baixados'] =
          Variable<int>(quantidadeTotalBensBaixados);
    }
    return map;
  }

  LevantamentoDBCompanion toCompanion(bool nullToAbsent) {
    return LevantamentoDBCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idOrganizacao: idOrganizacao == null && nullToAbsent
          ? const Value.absent()
          : Value(idOrganizacao),
      nome: nome == null && nullToAbsent ? const Value.absent() : Value(nome),
      codigoENome: codigoENome == null && nullToAbsent
          ? const Value.absent()
          : Value(codigoENome),
      codigo:
          codigo == null && nullToAbsent ? const Value.absent() : Value(codigo),
      dominioTipoInventario: dominioTipoInventario == null && nullToAbsent
          ? const Value.absent()
          : Value(dominioTipoInventario),
      dominioStatusInventario: dominioStatusInventario == null && nullToAbsent
          ? const Value.absent()
          : Value(dominioStatusInventario),
      quantidadeEstruturas: quantidadeEstruturas == null && nullToAbsent
          ? const Value.absent()
          : Value(quantidadeEstruturas),
      quantidadeTotalBens: quantidadeTotalBens == null && nullToAbsent
          ? const Value.absent()
          : Value(quantidadeTotalBens),
      quantidadeTotalBensTratados:
          quantidadeTotalBensTratados == null && nullToAbsent
              ? const Value.absent()
              : Value(quantidadeTotalBensTratados),
      quantidadeTotalBensEmInconsistencia:
          quantidadeTotalBensEmInconsistencia == null && nullToAbsent
              ? const Value.absent()
              : Value(quantidadeTotalBensEmInconsistencia),
      quantidadeTotalBensSemInconsistencia:
          quantidadeTotalBensSemInconsistencia == null && nullToAbsent
              ? const Value.absent()
              : Value(quantidadeTotalBensSemInconsistencia),
      quantidadeTotalBensBaixados:
          quantidadeTotalBensBaixados == null && nullToAbsent
              ? const Value.absent()
              : Value(quantidadeTotalBensBaixados),
    );
  }

  factory LevantamentoDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return LevantamentoDBData(
      id: serializer.fromJson<int>(json['id']),
      idOrganizacao: serializer.fromJson<int>(json['idOrganizacao']),
      nome: serializer.fromJson<String>(json['nome']),
      codigoENome: serializer.fromJson<String>(json['codigoENome']),
      codigo: serializer.fromJson<String>(json['codigo']),
      dominioTipoInventario:
          serializer.fromJson<Dominio>(json['dominioTipoInventario']),
      dominioStatusInventario:
          serializer.fromJson<Dominio>(json['dominioStatusInventario']),
      quantidadeEstruturas:
          serializer.fromJson<int>(json['quantidadeEstruturas']),
      quantidadeTotalBens:
          serializer.fromJson<int>(json['quantidadeTotalBens']),
      quantidadeTotalBensTratados:
          serializer.fromJson<int>(json['quantidadeTotalBensTratados']),
      quantidadeTotalBensEmInconsistencia:
          serializer.fromJson<int>(json['quantidadeTotalBensEmInconsistencia']),
      quantidadeTotalBensSemInconsistencia: serializer
          .fromJson<int>(json['quantidadeTotalBensSemInconsistencia']),
      quantidadeTotalBensBaixados:
          serializer.fromJson<int>(json['quantidadeTotalBensBaixados']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idOrganizacao': serializer.toJson<int>(idOrganizacao),
      'nome': serializer.toJson<String>(nome),
      'codigoENome': serializer.toJson<String>(codigoENome),
      'codigo': serializer.toJson<String>(codigo),
      'dominioTipoInventario':
          serializer.toJson<Dominio>(dominioTipoInventario),
      'dominioStatusInventario':
          serializer.toJson<Dominio>(dominioStatusInventario),
      'quantidadeEstruturas': serializer.toJson<int>(quantidadeEstruturas),
      'quantidadeTotalBens': serializer.toJson<int>(quantidadeTotalBens),
      'quantidadeTotalBensTratados':
          serializer.toJson<int>(quantidadeTotalBensTratados),
      'quantidadeTotalBensEmInconsistencia':
          serializer.toJson<int>(quantidadeTotalBensEmInconsistencia),
      'quantidadeTotalBensSemInconsistencia':
          serializer.toJson<int>(quantidadeTotalBensSemInconsistencia),
      'quantidadeTotalBensBaixados':
          serializer.toJson<int>(quantidadeTotalBensBaixados),
    };
  }

  LevantamentoDBData copyWith(
          {int id,
          int idOrganizacao,
          String nome,
          String codigoENome,
          String codigo,
          Dominio dominioTipoInventario,
          Dominio dominioStatusInventario,
          int quantidadeEstruturas,
          int quantidadeTotalBens,
          int quantidadeTotalBensTratados,
          int quantidadeTotalBensEmInconsistencia,
          int quantidadeTotalBensSemInconsistencia,
          int quantidadeTotalBensBaixados}) =>
      LevantamentoDBData(
        id: id ?? this.id,
        idOrganizacao: idOrganizacao ?? this.idOrganizacao,
        nome: nome ?? this.nome,
        codigoENome: codigoENome ?? this.codigoENome,
        codigo: codigo ?? this.codigo,
        dominioTipoInventario:
            dominioTipoInventario ?? this.dominioTipoInventario,
        dominioStatusInventario:
            dominioStatusInventario ?? this.dominioStatusInventario,
        quantidadeEstruturas: quantidadeEstruturas ?? this.quantidadeEstruturas,
        quantidadeTotalBens: quantidadeTotalBens ?? this.quantidadeTotalBens,
        quantidadeTotalBensTratados:
            quantidadeTotalBensTratados ?? this.quantidadeTotalBensTratados,
        quantidadeTotalBensEmInconsistencia:
            quantidadeTotalBensEmInconsistencia ??
                this.quantidadeTotalBensEmInconsistencia,
        quantidadeTotalBensSemInconsistencia:
            quantidadeTotalBensSemInconsistencia ??
                this.quantidadeTotalBensSemInconsistencia,
        quantidadeTotalBensBaixados:
            quantidadeTotalBensBaixados ?? this.quantidadeTotalBensBaixados,
      );
  @override
  String toString() {
    return (StringBuffer('LevantamentoDBData(')
          ..write('id: $id, ')
          ..write('idOrganizacao: $idOrganizacao, ')
          ..write('nome: $nome, ')
          ..write('codigoENome: $codigoENome, ')
          ..write('codigo: $codigo, ')
          ..write('dominioTipoInventario: $dominioTipoInventario, ')
          ..write('dominioStatusInventario: $dominioStatusInventario, ')
          ..write('quantidadeEstruturas: $quantidadeEstruturas, ')
          ..write('quantidadeTotalBens: $quantidadeTotalBens, ')
          ..write('quantidadeTotalBensTratados: $quantidadeTotalBensTratados, ')
          ..write(
              'quantidadeTotalBensEmInconsistencia: $quantidadeTotalBensEmInconsistencia, ')
          ..write(
              'quantidadeTotalBensSemInconsistencia: $quantidadeTotalBensSemInconsistencia, ')
          ..write('quantidadeTotalBensBaixados: $quantidadeTotalBensBaixados')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idOrganizacao.hashCode,
          $mrjc(
              nome.hashCode,
              $mrjc(
                  codigoENome.hashCode,
                  $mrjc(
                      codigo.hashCode,
                      $mrjc(
                          dominioTipoInventario.hashCode,
                          $mrjc(
                              dominioStatusInventario.hashCode,
                              $mrjc(
                                  quantidadeEstruturas.hashCode,
                                  $mrjc(
                                      quantidadeTotalBens.hashCode,
                                      $mrjc(
                                          quantidadeTotalBensTratados.hashCode,
                                          $mrjc(
                                              quantidadeTotalBensEmInconsistencia
                                                  .hashCode,
                                              $mrjc(
                                                  quantidadeTotalBensSemInconsistencia
                                                      .hashCode,
                                                  quantidadeTotalBensBaixados
                                                      .hashCode)))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is LevantamentoDBData &&
          other.id == this.id &&
          other.idOrganizacao == this.idOrganizacao &&
          other.nome == this.nome &&
          other.codigoENome == this.codigoENome &&
          other.codigo == this.codigo &&
          other.dominioTipoInventario == this.dominioTipoInventario &&
          other.dominioStatusInventario == this.dominioStatusInventario &&
          other.quantidadeEstruturas == this.quantidadeEstruturas &&
          other.quantidadeTotalBens == this.quantidadeTotalBens &&
          other.quantidadeTotalBensTratados ==
              this.quantidadeTotalBensTratados &&
          other.quantidadeTotalBensEmInconsistencia ==
              this.quantidadeTotalBensEmInconsistencia &&
          other.quantidadeTotalBensSemInconsistencia ==
              this.quantidadeTotalBensSemInconsistencia &&
          other.quantidadeTotalBensBaixados ==
              this.quantidadeTotalBensBaixados);
}

class LevantamentoDBCompanion extends UpdateCompanion<LevantamentoDBData> {
  final Value<int> id;
  final Value<int> idOrganizacao;
  final Value<String> nome;
  final Value<String> codigoENome;
  final Value<String> codigo;
  final Value<Dominio> dominioTipoInventario;
  final Value<Dominio> dominioStatusInventario;
  final Value<int> quantidadeEstruturas;
  final Value<int> quantidadeTotalBens;
  final Value<int> quantidadeTotalBensTratados;
  final Value<int> quantidadeTotalBensEmInconsistencia;
  final Value<int> quantidadeTotalBensSemInconsistencia;
  final Value<int> quantidadeTotalBensBaixados;
  const LevantamentoDBCompanion({
    this.id = const Value.absent(),
    this.idOrganizacao = const Value.absent(),
    this.nome = const Value.absent(),
    this.codigoENome = const Value.absent(),
    this.codigo = const Value.absent(),
    this.dominioTipoInventario = const Value.absent(),
    this.dominioStatusInventario = const Value.absent(),
    this.quantidadeEstruturas = const Value.absent(),
    this.quantidadeTotalBens = const Value.absent(),
    this.quantidadeTotalBensTratados = const Value.absent(),
    this.quantidadeTotalBensEmInconsistencia = const Value.absent(),
    this.quantidadeTotalBensSemInconsistencia = const Value.absent(),
    this.quantidadeTotalBensBaixados = const Value.absent(),
  });
  LevantamentoDBCompanion.insert({
    @required int id,
    this.idOrganizacao = const Value.absent(),
    this.nome = const Value.absent(),
    this.codigoENome = const Value.absent(),
    this.codigo = const Value.absent(),
    this.dominioTipoInventario = const Value.absent(),
    this.dominioStatusInventario = const Value.absent(),
    this.quantidadeEstruturas = const Value.absent(),
    this.quantidadeTotalBens = const Value.absent(),
    this.quantidadeTotalBensTratados = const Value.absent(),
    this.quantidadeTotalBensEmInconsistencia = const Value.absent(),
    this.quantidadeTotalBensSemInconsistencia = const Value.absent(),
    this.quantidadeTotalBensBaixados = const Value.absent(),
  }) : id = Value(id);
  static Insertable<LevantamentoDBData> custom({
    Expression<int> id,
    Expression<int> idOrganizacao,
    Expression<String> nome,
    Expression<String> codigoENome,
    Expression<String> codigo,
    Expression<String> dominioTipoInventario,
    Expression<String> dominioStatusInventario,
    Expression<int> quantidadeEstruturas,
    Expression<int> quantidadeTotalBens,
    Expression<int> quantidadeTotalBensTratados,
    Expression<int> quantidadeTotalBensEmInconsistencia,
    Expression<int> quantidadeTotalBensSemInconsistencia,
    Expression<int> quantidadeTotalBensBaixados,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idOrganizacao != null) 'id_organizacao': idOrganizacao,
      if (nome != null) 'nome': nome,
      if (codigoENome != null) 'codigo_e_nome': codigoENome,
      if (codigo != null) 'codigo': codigo,
      if (dominioTipoInventario != null)
        'dominio_tipo_inventario': dominioTipoInventario,
      if (dominioStatusInventario != null)
        'dominio_status_inventario': dominioStatusInventario,
      if (quantidadeEstruturas != null)
        'quantidade_estruturas': quantidadeEstruturas,
      if (quantidadeTotalBens != null)
        'quantidade_total_bens': quantidadeTotalBens,
      if (quantidadeTotalBensTratados != null)
        'quantidade_total_bens_tratados': quantidadeTotalBensTratados,
      if (quantidadeTotalBensEmInconsistencia != null)
        'quantidade_total_bens_em_inconsistencia':
            quantidadeTotalBensEmInconsistencia,
      if (quantidadeTotalBensSemInconsistencia != null)
        'quantidade_total_bens_sem_inconsistencia':
            quantidadeTotalBensSemInconsistencia,
      if (quantidadeTotalBensBaixados != null)
        'quantidade_total_bens_baixados': quantidadeTotalBensBaixados,
    });
  }

  LevantamentoDBCompanion copyWith(
      {Value<int> id,
      Value<int> idOrganizacao,
      Value<String> nome,
      Value<String> codigoENome,
      Value<String> codigo,
      Value<Dominio> dominioTipoInventario,
      Value<Dominio> dominioStatusInventario,
      Value<int> quantidadeEstruturas,
      Value<int> quantidadeTotalBens,
      Value<int> quantidadeTotalBensTratados,
      Value<int> quantidadeTotalBensEmInconsistencia,
      Value<int> quantidadeTotalBensSemInconsistencia,
      Value<int> quantidadeTotalBensBaixados}) {
    return LevantamentoDBCompanion(
      id: id ?? this.id,
      idOrganizacao: idOrganizacao ?? this.idOrganizacao,
      nome: nome ?? this.nome,
      codigoENome: codigoENome ?? this.codigoENome,
      codigo: codigo ?? this.codigo,
      dominioTipoInventario:
          dominioTipoInventario ?? this.dominioTipoInventario,
      dominioStatusInventario:
          dominioStatusInventario ?? this.dominioStatusInventario,
      quantidadeEstruturas: quantidadeEstruturas ?? this.quantidadeEstruturas,
      quantidadeTotalBens: quantidadeTotalBens ?? this.quantidadeTotalBens,
      quantidadeTotalBensTratados:
          quantidadeTotalBensTratados ?? this.quantidadeTotalBensTratados,
      quantidadeTotalBensEmInconsistencia:
          quantidadeTotalBensEmInconsistencia ??
              this.quantidadeTotalBensEmInconsistencia,
      quantidadeTotalBensSemInconsistencia:
          quantidadeTotalBensSemInconsistencia ??
              this.quantidadeTotalBensSemInconsistencia,
      quantidadeTotalBensBaixados:
          quantidadeTotalBensBaixados ?? this.quantidadeTotalBensBaixados,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idOrganizacao.present) {
      map['id_organizacao'] = Variable<int>(idOrganizacao.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (codigoENome.present) {
      map['codigo_e_nome'] = Variable<String>(codigoENome.value);
    }
    if (codigo.present) {
      map['codigo'] = Variable<String>(codigo.value);
    }
    if (dominioTipoInventario.present) {
      final converter = $LevantamentoDBTable.$converter0;
      map['dominio_tipo_inventario'] =
          Variable<String>(converter.mapToSql(dominioTipoInventario.value));
    }
    if (dominioStatusInventario.present) {
      final converter = $LevantamentoDBTable.$converter1;
      map['dominio_status_inventario'] =
          Variable<String>(converter.mapToSql(dominioStatusInventario.value));
    }
    if (quantidadeEstruturas.present) {
      map['quantidade_estruturas'] = Variable<int>(quantidadeEstruturas.value);
    }
    if (quantidadeTotalBens.present) {
      map['quantidade_total_bens'] = Variable<int>(quantidadeTotalBens.value);
    }
    if (quantidadeTotalBensTratados.present) {
      map['quantidade_total_bens_tratados'] =
          Variable<int>(quantidadeTotalBensTratados.value);
    }
    if (quantidadeTotalBensEmInconsistencia.present) {
      map['quantidade_total_bens_em_inconsistencia'] =
          Variable<int>(quantidadeTotalBensEmInconsistencia.value);
    }
    if (quantidadeTotalBensSemInconsistencia.present) {
      map['quantidade_total_bens_sem_inconsistencia'] =
          Variable<int>(quantidadeTotalBensSemInconsistencia.value);
    }
    if (quantidadeTotalBensBaixados.present) {
      map['quantidade_total_bens_baixados'] =
          Variable<int>(quantidadeTotalBensBaixados.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LevantamentoDBCompanion(')
          ..write('id: $id, ')
          ..write('idOrganizacao: $idOrganizacao, ')
          ..write('nome: $nome, ')
          ..write('codigoENome: $codigoENome, ')
          ..write('codigo: $codigo, ')
          ..write('dominioTipoInventario: $dominioTipoInventario, ')
          ..write('dominioStatusInventario: $dominioStatusInventario, ')
          ..write('quantidadeEstruturas: $quantidadeEstruturas, ')
          ..write('quantidadeTotalBens: $quantidadeTotalBens, ')
          ..write('quantidadeTotalBensTratados: $quantidadeTotalBensTratados, ')
          ..write(
              'quantidadeTotalBensEmInconsistencia: $quantidadeTotalBensEmInconsistencia, ')
          ..write(
              'quantidadeTotalBensSemInconsistencia: $quantidadeTotalBensSemInconsistencia, ')
          ..write('quantidadeTotalBensBaixados: $quantidadeTotalBensBaixados')
          ..write(')'))
        .toString();
  }
}

class $LevantamentoDBTable extends LevantamentoDB
    with TableInfo<$LevantamentoDBTable, LevantamentoDBData> {
  final GeneratedDatabase _db;
  final String _alias;
  $LevantamentoDBTable(this._db, [this._alias]);
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

  final VerificationMeta _idOrganizacaoMeta =
      const VerificationMeta('idOrganizacao');
  GeneratedIntColumn _idOrganizacao;
  @override
  GeneratedIntColumn get idOrganizacao =>
      _idOrganizacao ??= _constructIdOrganizacao();
  GeneratedIntColumn _constructIdOrganizacao() {
    return GeneratedIntColumn(
      'id_organizacao',
      $tableName,
      true,
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
      true,
    );
  }

  final VerificationMeta _codigoENomeMeta =
      const VerificationMeta('codigoENome');
  GeneratedTextColumn _codigoENome;
  @override
  GeneratedTextColumn get codigoENome =>
      _codigoENome ??= _constructCodigoENome();
  GeneratedTextColumn _constructCodigoENome() {
    return GeneratedTextColumn(
      'codigo_e_nome',
      $tableName,
      true,
    );
  }

  final VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  GeneratedTextColumn _codigo;
  @override
  GeneratedTextColumn get codigo => _codigo ??= _constructCodigo();
  GeneratedTextColumn _constructCodigo() {
    return GeneratedTextColumn(
      'codigo',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dominioTipoInventarioMeta =
      const VerificationMeta('dominioTipoInventario');
  GeneratedTextColumn _dominioTipoInventario;
  @override
  GeneratedTextColumn get dominioTipoInventario =>
      _dominioTipoInventario ??= _constructDominioTipoInventario();
  GeneratedTextColumn _constructDominioTipoInventario() {
    return GeneratedTextColumn(
      'dominio_tipo_inventario',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dominioStatusInventarioMeta =
      const VerificationMeta('dominioStatusInventario');
  GeneratedTextColumn _dominioStatusInventario;
  @override
  GeneratedTextColumn get dominioStatusInventario =>
      _dominioStatusInventario ??= _constructDominioStatusInventario();
  GeneratedTextColumn _constructDominioStatusInventario() {
    return GeneratedTextColumn(
      'dominio_status_inventario',
      $tableName,
      true,
    );
  }

  final VerificationMeta _quantidadeEstruturasMeta =
      const VerificationMeta('quantidadeEstruturas');
  GeneratedIntColumn _quantidadeEstruturas;
  @override
  GeneratedIntColumn get quantidadeEstruturas =>
      _quantidadeEstruturas ??= _constructQuantidadeEstruturas();
  GeneratedIntColumn _constructQuantidadeEstruturas() {
    return GeneratedIntColumn(
      'quantidade_estruturas',
      $tableName,
      true,
    );
  }

  final VerificationMeta _quantidadeTotalBensMeta =
      const VerificationMeta('quantidadeTotalBens');
  GeneratedIntColumn _quantidadeTotalBens;
  @override
  GeneratedIntColumn get quantidadeTotalBens =>
      _quantidadeTotalBens ??= _constructQuantidadeTotalBens();
  GeneratedIntColumn _constructQuantidadeTotalBens() {
    return GeneratedIntColumn(
      'quantidade_total_bens',
      $tableName,
      true,
    );
  }

  final VerificationMeta _quantidadeTotalBensTratadosMeta =
      const VerificationMeta('quantidadeTotalBensTratados');
  GeneratedIntColumn _quantidadeTotalBensTratados;
  @override
  GeneratedIntColumn get quantidadeTotalBensTratados =>
      _quantidadeTotalBensTratados ??= _constructQuantidadeTotalBensTratados();
  GeneratedIntColumn _constructQuantidadeTotalBensTratados() {
    return GeneratedIntColumn(
      'quantidade_total_bens_tratados',
      $tableName,
      true,
    );
  }

  final VerificationMeta _quantidadeTotalBensEmInconsistenciaMeta =
      const VerificationMeta('quantidadeTotalBensEmInconsistencia');
  GeneratedIntColumn _quantidadeTotalBensEmInconsistencia;
  @override
  GeneratedIntColumn get quantidadeTotalBensEmInconsistencia =>
      _quantidadeTotalBensEmInconsistencia ??=
          _constructQuantidadeTotalBensEmInconsistencia();
  GeneratedIntColumn _constructQuantidadeTotalBensEmInconsistencia() {
    return GeneratedIntColumn(
      'quantidade_total_bens_em_inconsistencia',
      $tableName,
      true,
    );
  }

  final VerificationMeta _quantidadeTotalBensSemInconsistenciaMeta =
      const VerificationMeta('quantidadeTotalBensSemInconsistencia');
  GeneratedIntColumn _quantidadeTotalBensSemInconsistencia;
  @override
  GeneratedIntColumn get quantidadeTotalBensSemInconsistencia =>
      _quantidadeTotalBensSemInconsistencia ??=
          _constructQuantidadeTotalBensSemInconsistencia();
  GeneratedIntColumn _constructQuantidadeTotalBensSemInconsistencia() {
    return GeneratedIntColumn(
      'quantidade_total_bens_sem_inconsistencia',
      $tableName,
      true,
    );
  }

  final VerificationMeta _quantidadeTotalBensBaixadosMeta =
      const VerificationMeta('quantidadeTotalBensBaixados');
  GeneratedIntColumn _quantidadeTotalBensBaixados;
  @override
  GeneratedIntColumn get quantidadeTotalBensBaixados =>
      _quantidadeTotalBensBaixados ??= _constructQuantidadeTotalBensBaixados();
  GeneratedIntColumn _constructQuantidadeTotalBensBaixados() {
    return GeneratedIntColumn(
      'quantidade_total_bens_baixados',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        idOrganizacao,
        nome,
        codigoENome,
        codigo,
        dominioTipoInventario,
        dominioStatusInventario,
        quantidadeEstruturas,
        quantidadeTotalBens,
        quantidadeTotalBensTratados,
        quantidadeTotalBensEmInconsistencia,
        quantidadeTotalBensSemInconsistencia,
        quantidadeTotalBensBaixados
      ];
  @override
  $LevantamentoDBTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'levantamento_d_b';
  @override
  final String actualTableName = 'levantamento_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<LevantamentoDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('id_organizacao')) {
      context.handle(
          _idOrganizacaoMeta,
          idOrganizacao.isAcceptableOrUnknown(
              data['id_organizacao'], _idOrganizacaoMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome'], _nomeMeta));
    }
    if (data.containsKey('codigo_e_nome')) {
      context.handle(
          _codigoENomeMeta,
          codigoENome.isAcceptableOrUnknown(
              data['codigo_e_nome'], _codigoENomeMeta));
    }
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo'], _codigoMeta));
    }
    context.handle(
        _dominioTipoInventarioMeta, const VerificationResult.success());
    context.handle(
        _dominioStatusInventarioMeta, const VerificationResult.success());
    if (data.containsKey('quantidade_estruturas')) {
      context.handle(
          _quantidadeEstruturasMeta,
          quantidadeEstruturas.isAcceptableOrUnknown(
              data['quantidade_estruturas'], _quantidadeEstruturasMeta));
    }
    if (data.containsKey('quantidade_total_bens')) {
      context.handle(
          _quantidadeTotalBensMeta,
          quantidadeTotalBens.isAcceptableOrUnknown(
              data['quantidade_total_bens'], _quantidadeTotalBensMeta));
    }
    if (data.containsKey('quantidade_total_bens_tratados')) {
      context.handle(
          _quantidadeTotalBensTratadosMeta,
          quantidadeTotalBensTratados.isAcceptableOrUnknown(
              data['quantidade_total_bens_tratados'],
              _quantidadeTotalBensTratadosMeta));
    }
    if (data.containsKey('quantidade_total_bens_em_inconsistencia')) {
      context.handle(
          _quantidadeTotalBensEmInconsistenciaMeta,
          quantidadeTotalBensEmInconsistencia.isAcceptableOrUnknown(
              data['quantidade_total_bens_em_inconsistencia'],
              _quantidadeTotalBensEmInconsistenciaMeta));
    }
    if (data.containsKey('quantidade_total_bens_sem_inconsistencia')) {
      context.handle(
          _quantidadeTotalBensSemInconsistenciaMeta,
          quantidadeTotalBensSemInconsistencia.isAcceptableOrUnknown(
              data['quantidade_total_bens_sem_inconsistencia'],
              _quantidadeTotalBensSemInconsistenciaMeta));
    }
    if (data.containsKey('quantidade_total_bens_baixados')) {
      context.handle(
          _quantidadeTotalBensBaixadosMeta,
          quantidadeTotalBensBaixados.isAcceptableOrUnknown(
              data['quantidade_total_bens_baixados'],
              _quantidadeTotalBensBaixadosMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  LevantamentoDBData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return LevantamentoDBData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $LevantamentoDBTable createAlias(String alias) {
    return $LevantamentoDBTable(_db, alias);
  }

  static TypeConverter<Dominio, String> $converter0 = const DominioConverter();
  static TypeConverter<Dominio, String> $converter1 = const DominioConverter();
}

class ConexaoDBData extends DataClass implements Insertable<ConexaoDBData> {
  final int id;
  final String nome;
  final String url;
  final bool ativo;
  ConexaoDBData({@required this.id, this.nome, this.url, this.ativo});
  factory ConexaoDBData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return ConexaoDBData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      nome: stringType.mapFromDatabaseResponse(data['${effectivePrefix}nome']),
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']),
      ativo: boolType.mapFromDatabaseResponse(data['${effectivePrefix}ativo']),
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
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || ativo != null) {
      map['ativo'] = Variable<bool>(ativo);
    }
    return map;
  }

  ConexaoDBCompanion toCompanion(bool nullToAbsent) {
    return ConexaoDBCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      nome: nome == null && nullToAbsent ? const Value.absent() : Value(nome),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      ativo:
          ativo == null && nullToAbsent ? const Value.absent() : Value(ativo),
    );
  }

  factory ConexaoDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ConexaoDBData(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      url: serializer.fromJson<String>(json['url']),
      ativo: serializer.fromJson<bool>(json['ativo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'url': serializer.toJson<String>(url),
      'ativo': serializer.toJson<bool>(ativo),
    };
  }

  ConexaoDBData copyWith({int id, String nome, String url, bool ativo}) =>
      ConexaoDBData(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        url: url ?? this.url,
        ativo: ativo ?? this.ativo,
      );
  @override
  String toString() {
    return (StringBuffer('ConexaoDBData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('url: $url, ')
          ..write('ativo: $ativo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(nome.hashCode, $mrjc(url.hashCode, ativo.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ConexaoDBData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.url == this.url &&
          other.ativo == this.ativo);
}

class ConexaoDBCompanion extends UpdateCompanion<ConexaoDBData> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String> url;
  final Value<bool> ativo;
  const ConexaoDBCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.url = const Value.absent(),
    this.ativo = const Value.absent(),
  });
  ConexaoDBCompanion.insert({
    @required int id,
    this.nome = const Value.absent(),
    this.url = const Value.absent(),
    this.ativo = const Value.absent(),
  }) : id = Value(id);
  static Insertable<ConexaoDBData> custom({
    Expression<int> id,
    Expression<String> nome,
    Expression<String> url,
    Expression<bool> ativo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (url != null) 'url': url,
      if (ativo != null) 'ativo': ativo,
    });
  }

  ConexaoDBCompanion copyWith(
      {Value<int> id,
      Value<String> nome,
      Value<String> url,
      Value<bool> ativo}) {
    return ConexaoDBCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      url: url ?? this.url,
      ativo: ativo ?? this.ativo,
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
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (ativo.present) {
      map['ativo'] = Variable<bool>(ativo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConexaoDBCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('url: $url, ')
          ..write('ativo: $ativo')
          ..write(')'))
        .toString();
  }
}

class $ConexaoDBTable extends ConexaoDB
    with TableInfo<$ConexaoDBTable, ConexaoDBData> {
  final GeneratedDatabase _db;
  final String _alias;
  $ConexaoDBTable(this._db, [this._alias]);
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
      true,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  GeneratedTextColumn _url;
  @override
  GeneratedTextColumn get url => _url ??= _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ativoMeta = const VerificationMeta('ativo');
  GeneratedBoolColumn _ativo;
  @override
  GeneratedBoolColumn get ativo => _ativo ??= _constructAtivo();
  GeneratedBoolColumn _constructAtivo() {
    return GeneratedBoolColumn(
      'ativo',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, nome, url, ativo];
  @override
  $ConexaoDBTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'conexao_d_b';
  @override
  final String actualTableName = 'conexao_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<ConexaoDBData> instance,
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
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url'], _urlMeta));
    }
    if (data.containsKey('ativo')) {
      context.handle(
          _ativoMeta, ativo.isAcceptableOrUnknown(data['ativo'], _ativoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ConexaoDBData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ConexaoDBData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ConexaoDBTable createAlias(String alias) {
    return $ConexaoDBTable(_db, alias);
  }
}

class UnidadesGestorasDBData extends DataClass
    implements Insertable<UnidadesGestorasDBData> {
  final int id;
  final Organizacao organizacao;
  UnidadesGestorasDBData({this.id, this.organizacao});
  factory UnidadesGestorasDBData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return UnidadesGestorasDBData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      organizacao: $UnidadesGestorasDBTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}organizacao'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || organizacao != null) {
      final converter = $UnidadesGestorasDBTable.$converter0;
      map['organizacao'] = Variable<String>(converter.mapToSql(organizacao));
    }
    return map;
  }

  UnidadesGestorasDBCompanion toCompanion(bool nullToAbsent) {
    return UnidadesGestorasDBCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      organizacao: organizacao == null && nullToAbsent
          ? const Value.absent()
          : Value(organizacao),
    );
  }

  factory UnidadesGestorasDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UnidadesGestorasDBData(
      id: serializer.fromJson<int>(json['id']),
      organizacao: serializer.fromJson<Organizacao>(json['organizacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'organizacao': serializer.toJson<Organizacao>(organizacao),
    };
  }

  UnidadesGestorasDBData copyWith({int id, Organizacao organizacao}) =>
      UnidadesGestorasDBData(
        id: id ?? this.id,
        organizacao: organizacao ?? this.organizacao,
      );
  @override
  String toString() {
    return (StringBuffer('UnidadesGestorasDBData(')
          ..write('id: $id, ')
          ..write('organizacao: $organizacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, organizacao.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is UnidadesGestorasDBData &&
          other.id == this.id &&
          other.organizacao == this.organizacao);
}

class UnidadesGestorasDBCompanion
    extends UpdateCompanion<UnidadesGestorasDBData> {
  final Value<int> id;
  final Value<Organizacao> organizacao;
  const UnidadesGestorasDBCompanion({
    this.id = const Value.absent(),
    this.organizacao = const Value.absent(),
  });
  UnidadesGestorasDBCompanion.insert({
    this.id = const Value.absent(),
    this.organizacao = const Value.absent(),
  });
  static Insertable<UnidadesGestorasDBData> custom({
    Expression<int> id,
    Expression<String> organizacao,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (organizacao != null) 'organizacao': organizacao,
    });
  }

  UnidadesGestorasDBCompanion copyWith(
      {Value<int> id, Value<Organizacao> organizacao}) {
    return UnidadesGestorasDBCompanion(
      id: id ?? this.id,
      organizacao: organizacao ?? this.organizacao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (organizacao.present) {
      final converter = $UnidadesGestorasDBTable.$converter0;
      map['organizacao'] =
          Variable<String>(converter.mapToSql(organizacao.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnidadesGestorasDBCompanion(')
          ..write('id: $id, ')
          ..write('organizacao: $organizacao')
          ..write(')'))
        .toString();
  }
}

class $UnidadesGestorasDBTable extends UnidadesGestorasDB
    with TableInfo<$UnidadesGestorasDBTable, UnidadesGestorasDBData> {
  final GeneratedDatabase _db;
  final String _alias;
  $UnidadesGestorasDBTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _organizacaoMeta =
      const VerificationMeta('organizacao');
  GeneratedTextColumn _organizacao;
  @override
  GeneratedTextColumn get organizacao =>
      _organizacao ??= _constructOrganizacao();
  GeneratedTextColumn _constructOrganizacao() {
    return GeneratedTextColumn(
      'organizacao',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, organizacao];
  @override
  $UnidadesGestorasDBTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'unidades_gestoras_d_b';
  @override
  final String actualTableName = 'unidades_gestoras_d_b';
  @override
  VerificationContext validateIntegrity(
      Insertable<UnidadesGestorasDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    context.handle(_organizacaoMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  UnidadesGestorasDBData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UnidadesGestorasDBData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UnidadesGestorasDBTable createAlias(String alias) {
    return $UnidadesGestorasDBTable(_db, alias);
  }

  static TypeConverter<Organizacao, String> $converter0 =
      const OrganizacaoConverter();
}

class DadosBemPatrimoniaisDBData extends DataClass
    implements Insertable<DadosBemPatrimoniaisDBData> {
  final int id;
  final int idInventario;
  final Material material;
  final Dominio dominioSituacaoFisica;
  final Dominio dominioStatus;
  final Dominio dominioStatusInventarioBem;
  final Organizacao estruturaOrganizacionalAtual;
  final InventarioDadosBemPatrimonial inventarioBemPatrimonial;
  final int idEstruturaOrganizacional;
  final int idBemPatrimonial;
  final String numeroPatrimonialCompleto;
  final bool inventariado;
  DadosBemPatrimoniaisDBData(
      {@required this.id,
      this.idInventario,
      this.material,
      this.dominioSituacaoFisica,
      this.dominioStatus,
      this.dominioStatusInventarioBem,
      this.estruturaOrganizacionalAtual,
      this.inventarioBemPatrimonial,
      this.idEstruturaOrganizacional,
      this.idBemPatrimonial,
      this.numeroPatrimonialCompleto,
      @required this.inventariado});
  factory DadosBemPatrimoniaisDBData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return DadosBemPatrimoniaisDBData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idInventario: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_inventario']),
      material: $DadosBemPatrimoniaisDBTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}material'])),
      dominioSituacaoFisica: $DadosBemPatrimoniaisDBTable.$converter1.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}dominio_situacao_fisica'])),
      dominioStatus: $DadosBemPatrimoniaisDBTable.$converter2.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}dominio_status'])),
      dominioStatusInventarioBem: $DadosBemPatrimoniaisDBTable.$converter3
          .mapToDart(stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}dominio_status_inventario_bem'])),
      estruturaOrganizacionalAtual: $DadosBemPatrimoniaisDBTable.$converter4
          .mapToDart(stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}estrutura_organizacional_atual'])),
      inventarioBemPatrimonial: $DadosBemPatrimoniaisDBTable.$converter5
          .mapToDart(stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}inventario_bem_patrimonial'])),
      idEstruturaOrganizacional: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}id_estrutura_organizacional']),
      idBemPatrimonial: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}id_bem_patrimonial']),
      numeroPatrimonialCompleto: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}numero_patrimonial_completo']),
      inventariado: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}inventariado']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idInventario != null) {
      map['id_inventario'] = Variable<int>(idInventario);
    }
    if (!nullToAbsent || material != null) {
      final converter = $DadosBemPatrimoniaisDBTable.$converter0;
      map['material'] = Variable<String>(converter.mapToSql(material));
    }
    if (!nullToAbsent || dominioSituacaoFisica != null) {
      final converter = $DadosBemPatrimoniaisDBTable.$converter1;
      map['dominio_situacao_fisica'] =
          Variable<String>(converter.mapToSql(dominioSituacaoFisica));
    }
    if (!nullToAbsent || dominioStatus != null) {
      final converter = $DadosBemPatrimoniaisDBTable.$converter2;
      map['dominio_status'] =
          Variable<String>(converter.mapToSql(dominioStatus));
    }
    if (!nullToAbsent || dominioStatusInventarioBem != null) {
      final converter = $DadosBemPatrimoniaisDBTable.$converter3;
      map['dominio_status_inventario_bem'] =
          Variable<String>(converter.mapToSql(dominioStatusInventarioBem));
    }
    if (!nullToAbsent || estruturaOrganizacionalAtual != null) {
      final converter = $DadosBemPatrimoniaisDBTable.$converter4;
      map['estrutura_organizacional_atual'] =
          Variable<String>(converter.mapToSql(estruturaOrganizacionalAtual));
    }
    if (!nullToAbsent || inventarioBemPatrimonial != null) {
      final converter = $DadosBemPatrimoniaisDBTable.$converter5;
      map['inventario_bem_patrimonial'] =
          Variable<String>(converter.mapToSql(inventarioBemPatrimonial));
    }
    if (!nullToAbsent || idEstruturaOrganizacional != null) {
      map['id_estrutura_organizacional'] =
          Variable<int>(idEstruturaOrganizacional);
    }
    if (!nullToAbsent || idBemPatrimonial != null) {
      map['id_bem_patrimonial'] = Variable<int>(idBemPatrimonial);
    }
    if (!nullToAbsent || numeroPatrimonialCompleto != null) {
      map['numero_patrimonial_completo'] =
          Variable<String>(numeroPatrimonialCompleto);
    }
    if (!nullToAbsent || inventariado != null) {
      map['inventariado'] = Variable<bool>(inventariado);
    }
    return map;
  }

  DadosBemPatrimoniaisDBCompanion toCompanion(bool nullToAbsent) {
    return DadosBemPatrimoniaisDBCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idInventario: idInventario == null && nullToAbsent
          ? const Value.absent()
          : Value(idInventario),
      material: material == null && nullToAbsent
          ? const Value.absent()
          : Value(material),
      dominioSituacaoFisica: dominioSituacaoFisica == null && nullToAbsent
          ? const Value.absent()
          : Value(dominioSituacaoFisica),
      dominioStatus: dominioStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(dominioStatus),
      dominioStatusInventarioBem:
          dominioStatusInventarioBem == null && nullToAbsent
              ? const Value.absent()
              : Value(dominioStatusInventarioBem),
      estruturaOrganizacionalAtual:
          estruturaOrganizacionalAtual == null && nullToAbsent
              ? const Value.absent()
              : Value(estruturaOrganizacionalAtual),
      inventarioBemPatrimonial: inventarioBemPatrimonial == null && nullToAbsent
          ? const Value.absent()
          : Value(inventarioBemPatrimonial),
      idEstruturaOrganizacional:
          idEstruturaOrganizacional == null && nullToAbsent
              ? const Value.absent()
              : Value(idEstruturaOrganizacional),
      idBemPatrimonial: idBemPatrimonial == null && nullToAbsent
          ? const Value.absent()
          : Value(idBemPatrimonial),
      numeroPatrimonialCompleto:
          numeroPatrimonialCompleto == null && nullToAbsent
              ? const Value.absent()
              : Value(numeroPatrimonialCompleto),
      inventariado: inventariado == null && nullToAbsent
          ? const Value.absent()
          : Value(inventariado),
    );
  }

  factory DadosBemPatrimoniaisDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DadosBemPatrimoniaisDBData(
      id: serializer.fromJson<int>(json['id']),
      idInventario: serializer.fromJson<int>(json['idInventario']),
      material: serializer.fromJson<Material>(json['material']),
      dominioSituacaoFisica:
          serializer.fromJson<Dominio>(json['dominioSituacaoFisica']),
      dominioStatus: serializer.fromJson<Dominio>(json['dominioStatus']),
      dominioStatusInventarioBem:
          serializer.fromJson<Dominio>(json['dominioStatusInventarioBem']),
      estruturaOrganizacionalAtual: serializer
          .fromJson<Organizacao>(json['estruturaOrganizacionalAtual']),
      inventarioBemPatrimonial:
          serializer.fromJson<InventarioDadosBemPatrimonial>(
              json['inventarioBemPatrimonial']),
      idEstruturaOrganizacional:
          serializer.fromJson<int>(json['idEstruturaOrganizacional']),
      idBemPatrimonial: serializer.fromJson<int>(json['idBemPatrimonial']),
      numeroPatrimonialCompleto:
          serializer.fromJson<String>(json['numeroPatrimonialCompleto']),
      inventariado: serializer.fromJson<bool>(json['inventariado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idInventario': serializer.toJson<int>(idInventario),
      'material': serializer.toJson<Material>(material),
      'dominioSituacaoFisica':
          serializer.toJson<Dominio>(dominioSituacaoFisica),
      'dominioStatus': serializer.toJson<Dominio>(dominioStatus),
      'dominioStatusInventarioBem':
          serializer.toJson<Dominio>(dominioStatusInventarioBem),
      'estruturaOrganizacionalAtual':
          serializer.toJson<Organizacao>(estruturaOrganizacionalAtual),
      'inventarioBemPatrimonial': serializer
          .toJson<InventarioDadosBemPatrimonial>(inventarioBemPatrimonial),
      'idEstruturaOrganizacional':
          serializer.toJson<int>(idEstruturaOrganizacional),
      'idBemPatrimonial': serializer.toJson<int>(idBemPatrimonial),
      'numeroPatrimonialCompleto':
          serializer.toJson<String>(numeroPatrimonialCompleto),
      'inventariado': serializer.toJson<bool>(inventariado),
    };
  }

  DadosBemPatrimoniaisDBData copyWith(
          {int id,
          int idInventario,
          Material material,
          Dominio dominioSituacaoFisica,
          Dominio dominioStatus,
          Dominio dominioStatusInventarioBem,
          Organizacao estruturaOrganizacionalAtual,
          InventarioDadosBemPatrimonial inventarioBemPatrimonial,
          int idEstruturaOrganizacional,
          int idBemPatrimonial,
          String numeroPatrimonialCompleto,
          bool inventariado}) =>
      DadosBemPatrimoniaisDBData(
        id: id ?? this.id,
        idInventario: idInventario ?? this.idInventario,
        material: material ?? this.material,
        dominioSituacaoFisica:
            dominioSituacaoFisica ?? this.dominioSituacaoFisica,
        dominioStatus: dominioStatus ?? this.dominioStatus,
        dominioStatusInventarioBem:
            dominioStatusInventarioBem ?? this.dominioStatusInventarioBem,
        estruturaOrganizacionalAtual:
            estruturaOrganizacionalAtual ?? this.estruturaOrganizacionalAtual,
        inventarioBemPatrimonial:
            inventarioBemPatrimonial ?? this.inventarioBemPatrimonial,
        idEstruturaOrganizacional:
            idEstruturaOrganizacional ?? this.idEstruturaOrganizacional,
        idBemPatrimonial: idBemPatrimonial ?? this.idBemPatrimonial,
        numeroPatrimonialCompleto:
            numeroPatrimonialCompleto ?? this.numeroPatrimonialCompleto,
        inventariado: inventariado ?? this.inventariado,
      );
  @override
  String toString() {
    return (StringBuffer('DadosBemPatrimoniaisDBData(')
          ..write('id: $id, ')
          ..write('idInventario: $idInventario, ')
          ..write('material: $material, ')
          ..write('dominioSituacaoFisica: $dominioSituacaoFisica, ')
          ..write('dominioStatus: $dominioStatus, ')
          ..write('dominioStatusInventarioBem: $dominioStatusInventarioBem, ')
          ..write(
              'estruturaOrganizacionalAtual: $estruturaOrganizacionalAtual, ')
          ..write('inventarioBemPatrimonial: $inventarioBemPatrimonial, ')
          ..write('idEstruturaOrganizacional: $idEstruturaOrganizacional, ')
          ..write('idBemPatrimonial: $idBemPatrimonial, ')
          ..write('numeroPatrimonialCompleto: $numeroPatrimonialCompleto, ')
          ..write('inventariado: $inventariado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idInventario.hashCode,
          $mrjc(
              material.hashCode,
              $mrjc(
                  dominioSituacaoFisica.hashCode,
                  $mrjc(
                      dominioStatus.hashCode,
                      $mrjc(
                          dominioStatusInventarioBem.hashCode,
                          $mrjc(
                              estruturaOrganizacionalAtual.hashCode,
                              $mrjc(
                                  inventarioBemPatrimonial.hashCode,
                                  $mrjc(
                                      idEstruturaOrganizacional.hashCode,
                                      $mrjc(
                                          idBemPatrimonial.hashCode,
                                          $mrjc(
                                              numeroPatrimonialCompleto
                                                  .hashCode,
                                              inventariado.hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DadosBemPatrimoniaisDBData &&
          other.id == this.id &&
          other.idInventario == this.idInventario &&
          other.material == this.material &&
          other.dominioSituacaoFisica == this.dominioSituacaoFisica &&
          other.dominioStatus == this.dominioStatus &&
          other.dominioStatusInventarioBem == this.dominioStatusInventarioBem &&
          other.estruturaOrganizacionalAtual ==
              this.estruturaOrganizacionalAtual &&
          other.inventarioBemPatrimonial == this.inventarioBemPatrimonial &&
          other.idEstruturaOrganizacional == this.idEstruturaOrganizacional &&
          other.idBemPatrimonial == this.idBemPatrimonial &&
          other.numeroPatrimonialCompleto == this.numeroPatrimonialCompleto &&
          other.inventariado == this.inventariado);
}

class DadosBemPatrimoniaisDBCompanion
    extends UpdateCompanion<DadosBemPatrimoniaisDBData> {
  final Value<int> id;
  final Value<int> idInventario;
  final Value<Material> material;
  final Value<Dominio> dominioSituacaoFisica;
  final Value<Dominio> dominioStatus;
  final Value<Dominio> dominioStatusInventarioBem;
  final Value<Organizacao> estruturaOrganizacionalAtual;
  final Value<InventarioDadosBemPatrimonial> inventarioBemPatrimonial;
  final Value<int> idEstruturaOrganizacional;
  final Value<int> idBemPatrimonial;
  final Value<String> numeroPatrimonialCompleto;
  final Value<bool> inventariado;
  const DadosBemPatrimoniaisDBCompanion({
    this.id = const Value.absent(),
    this.idInventario = const Value.absent(),
    this.material = const Value.absent(),
    this.dominioSituacaoFisica = const Value.absent(),
    this.dominioStatus = const Value.absent(),
    this.dominioStatusInventarioBem = const Value.absent(),
    this.estruturaOrganizacionalAtual = const Value.absent(),
    this.inventarioBemPatrimonial = const Value.absent(),
    this.idEstruturaOrganizacional = const Value.absent(),
    this.idBemPatrimonial = const Value.absent(),
    this.numeroPatrimonialCompleto = const Value.absent(),
    this.inventariado = const Value.absent(),
  });
  DadosBemPatrimoniaisDBCompanion.insert({
    @required int id,
    this.idInventario = const Value.absent(),
    this.material = const Value.absent(),
    this.dominioSituacaoFisica = const Value.absent(),
    this.dominioStatus = const Value.absent(),
    this.dominioStatusInventarioBem = const Value.absent(),
    this.estruturaOrganizacionalAtual = const Value.absent(),
    this.inventarioBemPatrimonial = const Value.absent(),
    this.idEstruturaOrganizacional = const Value.absent(),
    this.idBemPatrimonial = const Value.absent(),
    this.numeroPatrimonialCompleto = const Value.absent(),
    this.inventariado = const Value.absent(),
  }) : id = Value(id);
  static Insertable<DadosBemPatrimoniaisDBData> custom({
    Expression<int> id,
    Expression<int> idInventario,
    Expression<String> material,
    Expression<String> dominioSituacaoFisica,
    Expression<String> dominioStatus,
    Expression<String> dominioStatusInventarioBem,
    Expression<String> estruturaOrganizacionalAtual,
    Expression<String> inventarioBemPatrimonial,
    Expression<int> idEstruturaOrganizacional,
    Expression<int> idBemPatrimonial,
    Expression<String> numeroPatrimonialCompleto,
    Expression<bool> inventariado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idInventario != null) 'id_inventario': idInventario,
      if (material != null) 'material': material,
      if (dominioSituacaoFisica != null)
        'dominio_situacao_fisica': dominioSituacaoFisica,
      if (dominioStatus != null) 'dominio_status': dominioStatus,
      if (dominioStatusInventarioBem != null)
        'dominio_status_inventario_bem': dominioStatusInventarioBem,
      if (estruturaOrganizacionalAtual != null)
        'estrutura_organizacional_atual': estruturaOrganizacionalAtual,
      if (inventarioBemPatrimonial != null)
        'inventario_bem_patrimonial': inventarioBemPatrimonial,
      if (idEstruturaOrganizacional != null)
        'id_estrutura_organizacional': idEstruturaOrganizacional,
      if (idBemPatrimonial != null) 'id_bem_patrimonial': idBemPatrimonial,
      if (numeroPatrimonialCompleto != null)
        'numero_patrimonial_completo': numeroPatrimonialCompleto,
      if (inventariado != null) 'inventariado': inventariado,
    });
  }

  DadosBemPatrimoniaisDBCompanion copyWith(
      {Value<int> id,
      Value<int> idInventario,
      Value<Material> material,
      Value<Dominio> dominioSituacaoFisica,
      Value<Dominio> dominioStatus,
      Value<Dominio> dominioStatusInventarioBem,
      Value<Organizacao> estruturaOrganizacionalAtual,
      Value<InventarioDadosBemPatrimonial> inventarioBemPatrimonial,
      Value<int> idEstruturaOrganizacional,
      Value<int> idBemPatrimonial,
      Value<String> numeroPatrimonialCompleto,
      Value<bool> inventariado}) {
    return DadosBemPatrimoniaisDBCompanion(
      id: id ?? this.id,
      idInventario: idInventario ?? this.idInventario,
      material: material ?? this.material,
      dominioSituacaoFisica:
          dominioSituacaoFisica ?? this.dominioSituacaoFisica,
      dominioStatus: dominioStatus ?? this.dominioStatus,
      dominioStatusInventarioBem:
          dominioStatusInventarioBem ?? this.dominioStatusInventarioBem,
      estruturaOrganizacionalAtual:
          estruturaOrganizacionalAtual ?? this.estruturaOrganizacionalAtual,
      inventarioBemPatrimonial:
          inventarioBemPatrimonial ?? this.inventarioBemPatrimonial,
      idEstruturaOrganizacional:
          idEstruturaOrganizacional ?? this.idEstruturaOrganizacional,
      idBemPatrimonial: idBemPatrimonial ?? this.idBemPatrimonial,
      numeroPatrimonialCompleto:
          numeroPatrimonialCompleto ?? this.numeroPatrimonialCompleto,
      inventariado: inventariado ?? this.inventariado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idInventario.present) {
      map['id_inventario'] = Variable<int>(idInventario.value);
    }
    if (material.present) {
      final converter = $DadosBemPatrimoniaisDBTable.$converter0;
      map['material'] = Variable<String>(converter.mapToSql(material.value));
    }
    if (dominioSituacaoFisica.present) {
      final converter = $DadosBemPatrimoniaisDBTable.$converter1;
      map['dominio_situacao_fisica'] =
          Variable<String>(converter.mapToSql(dominioSituacaoFisica.value));
    }
    if (dominioStatus.present) {
      final converter = $DadosBemPatrimoniaisDBTable.$converter2;
      map['dominio_status'] =
          Variable<String>(converter.mapToSql(dominioStatus.value));
    }
    if (dominioStatusInventarioBem.present) {
      final converter = $DadosBemPatrimoniaisDBTable.$converter3;
      map['dominio_status_inventario_bem'] = Variable<String>(
          converter.mapToSql(dominioStatusInventarioBem.value));
    }
    if (estruturaOrganizacionalAtual.present) {
      final converter = $DadosBemPatrimoniaisDBTable.$converter4;
      map['estrutura_organizacional_atual'] = Variable<String>(
          converter.mapToSql(estruturaOrganizacionalAtual.value));
    }
    if (inventarioBemPatrimonial.present) {
      final converter = $DadosBemPatrimoniaisDBTable.$converter5;
      map['inventario_bem_patrimonial'] =
          Variable<String>(converter.mapToSql(inventarioBemPatrimonial.value));
    }
    if (idEstruturaOrganizacional.present) {
      map['id_estrutura_organizacional'] =
          Variable<int>(idEstruturaOrganizacional.value);
    }
    if (idBemPatrimonial.present) {
      map['id_bem_patrimonial'] = Variable<int>(idBemPatrimonial.value);
    }
    if (numeroPatrimonialCompleto.present) {
      map['numero_patrimonial_completo'] =
          Variable<String>(numeroPatrimonialCompleto.value);
    }
    if (inventariado.present) {
      map['inventariado'] = Variable<bool>(inventariado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DadosBemPatrimoniaisDBCompanion(')
          ..write('id: $id, ')
          ..write('idInventario: $idInventario, ')
          ..write('material: $material, ')
          ..write('dominioSituacaoFisica: $dominioSituacaoFisica, ')
          ..write('dominioStatus: $dominioStatus, ')
          ..write('dominioStatusInventarioBem: $dominioStatusInventarioBem, ')
          ..write(
              'estruturaOrganizacionalAtual: $estruturaOrganizacionalAtual, ')
          ..write('inventarioBemPatrimonial: $inventarioBemPatrimonial, ')
          ..write('idEstruturaOrganizacional: $idEstruturaOrganizacional, ')
          ..write('idBemPatrimonial: $idBemPatrimonial, ')
          ..write('numeroPatrimonialCompleto: $numeroPatrimonialCompleto, ')
          ..write('inventariado: $inventariado')
          ..write(')'))
        .toString();
  }
}

class $DadosBemPatrimoniaisDBTable extends DadosBemPatrimoniaisDB
    with TableInfo<$DadosBemPatrimoniaisDBTable, DadosBemPatrimoniaisDBData> {
  final GeneratedDatabase _db;
  final String _alias;
  $DadosBemPatrimoniaisDBTable(this._db, [this._alias]);
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

  final VerificationMeta _idInventarioMeta =
      const VerificationMeta('idInventario');
  GeneratedIntColumn _idInventario;
  @override
  GeneratedIntColumn get idInventario =>
      _idInventario ??= _constructIdInventario();
  GeneratedIntColumn _constructIdInventario() {
    return GeneratedIntColumn(
      'id_inventario',
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

  final VerificationMeta _dominioStatusInventarioBemMeta =
      const VerificationMeta('dominioStatusInventarioBem');
  GeneratedTextColumn _dominioStatusInventarioBem;
  @override
  GeneratedTextColumn get dominioStatusInventarioBem =>
      _dominioStatusInventarioBem ??= _constructDominioStatusInventarioBem();
  GeneratedTextColumn _constructDominioStatusInventarioBem() {
    return GeneratedTextColumn(
      'dominio_status_inventario_bem',
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

  final VerificationMeta _inventarioBemPatrimonialMeta =
      const VerificationMeta('inventarioBemPatrimonial');
  GeneratedTextColumn _inventarioBemPatrimonial;
  @override
  GeneratedTextColumn get inventarioBemPatrimonial =>
      _inventarioBemPatrimonial ??= _constructInventarioBemPatrimonial();
  GeneratedTextColumn _constructInventarioBemPatrimonial() {
    return GeneratedTextColumn(
      'inventario_bem_patrimonial',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idEstruturaOrganizacionalMeta =
      const VerificationMeta('idEstruturaOrganizacional');
  GeneratedIntColumn _idEstruturaOrganizacional;
  @override
  GeneratedIntColumn get idEstruturaOrganizacional =>
      _idEstruturaOrganizacional ??= _constructIdEstruturaOrganizacional();
  GeneratedIntColumn _constructIdEstruturaOrganizacional() {
    return GeneratedIntColumn(
      'id_estrutura_organizacional',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idBemPatrimonialMeta =
      const VerificationMeta('idBemPatrimonial');
  GeneratedIntColumn _idBemPatrimonial;
  @override
  GeneratedIntColumn get idBemPatrimonial =>
      _idBemPatrimonial ??= _constructIdBemPatrimonial();
  GeneratedIntColumn _constructIdBemPatrimonial() {
    return GeneratedIntColumn(
      'id_bem_patrimonial',
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

  final VerificationMeta _inventariadoMeta =
      const VerificationMeta('inventariado');
  GeneratedBoolColumn _inventariado;
  @override
  GeneratedBoolColumn get inventariado =>
      _inventariado ??= _constructInventariado();
  GeneratedBoolColumn _constructInventariado() {
    return GeneratedBoolColumn('inventariado', $tableName, false,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        idInventario,
        material,
        dominioSituacaoFisica,
        dominioStatus,
        dominioStatusInventarioBem,
        estruturaOrganizacionalAtual,
        inventarioBemPatrimonial,
        idEstruturaOrganizacional,
        idBemPatrimonial,
        numeroPatrimonialCompleto,
        inventariado
      ];
  @override
  $DadosBemPatrimoniaisDBTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'dados_bem_patrimoniais_d_b';
  @override
  final String actualTableName = 'dados_bem_patrimoniais_d_b';
  @override
  VerificationContext validateIntegrity(
      Insertable<DadosBemPatrimoniaisDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('id_inventario')) {
      context.handle(
          _idInventarioMeta,
          idInventario.isAcceptableOrUnknown(
              data['id_inventario'], _idInventarioMeta));
    }
    context.handle(_materialMeta, const VerificationResult.success());
    context.handle(
        _dominioSituacaoFisicaMeta, const VerificationResult.success());
    context.handle(_dominioStatusMeta, const VerificationResult.success());
    context.handle(
        _dominioStatusInventarioBemMeta, const VerificationResult.success());
    context.handle(
        _estruturaOrganizacionalAtualMeta, const VerificationResult.success());
    context.handle(
        _inventarioBemPatrimonialMeta, const VerificationResult.success());
    if (data.containsKey('id_estrutura_organizacional')) {
      context.handle(
          _idEstruturaOrganizacionalMeta,
          idEstruturaOrganizacional.isAcceptableOrUnknown(
              data['id_estrutura_organizacional'],
              _idEstruturaOrganizacionalMeta));
    }
    if (data.containsKey('id_bem_patrimonial')) {
      context.handle(
          _idBemPatrimonialMeta,
          idBemPatrimonial.isAcceptableOrUnknown(
              data['id_bem_patrimonial'], _idBemPatrimonialMeta));
    }
    if (data.containsKey('numero_patrimonial_completo')) {
      context.handle(
          _numeroPatrimonialCompletoMeta,
          numeroPatrimonialCompleto.isAcceptableOrUnknown(
              data['numero_patrimonial_completo'],
              _numeroPatrimonialCompletoMeta));
    }
    if (data.containsKey('inventariado')) {
      context.handle(
          _inventariadoMeta,
          inventariado.isAcceptableOrUnknown(
              data['inventariado'], _inventariadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DadosBemPatrimoniaisDBData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DadosBemPatrimoniaisDBData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  $DadosBemPatrimoniaisDBTable createAlias(String alias) {
    return $DadosBemPatrimoniaisDBTable(_db, alias);
  }

  static TypeConverter<Material, String> $converter0 =
      const MaterialConverter();
  static TypeConverter<Dominio, String> $converter1 = const DominioConverter();
  static TypeConverter<Dominio, String> $converter2 = const DominioConverter();
  static TypeConverter<Dominio, String> $converter3 = const DominioConverter();
  static TypeConverter<Organizacao, String> $converter4 =
      const OrganizacaoConverter();
  static TypeConverter<InventarioDadosBemPatrimonial, String> $converter5 =
      const InventarioBemPatrimonialConverter();
}

class InventarioBemPatrimonialDBData extends DataClass
    implements Insertable<InventarioBemPatrimonialDBData> {
  final int id;
  final int idDadosBemPatrimonialMobile;
  final int idInventarioEstruturaOrganizacionalMobile;
  final int idUnidadeOrganizacional;
  final int idDominioSituacaoFisica;
  final int idDominioStatus;
  final int identificaoPatrimonial;
  final int idEstruturaOrganizacionalAtual;
  final int idMaterial;
  final String numeroPatrimonial;
  final String numeroPatrimonialAntigo;
  final String numeroPatrimonialNovo;
  final String nomeUsuarioColeta;
  final String tipoMobile;
  final bool novoBemInvetariado;
  final bool enviado;
  final bool bemNaoEncontrado;
  final bool bemNaoInventariado;
  final List<Caracteristicas> caracteristicas;
  final Material material;
  final Dominio dominioSituacaoFisica;
  final Dominio dominioStatus;
  final Dominio dominioStatusInventarioBem;
  InventarioBemPatrimonialDBData(
      {this.id,
      this.idDadosBemPatrimonialMobile,
      this.idInventarioEstruturaOrganizacionalMobile,
      this.idUnidadeOrganizacional,
      this.idDominioSituacaoFisica,
      this.idDominioStatus,
      this.identificaoPatrimonial,
      this.idEstruturaOrganizacionalAtual,
      this.idMaterial,
      this.numeroPatrimonial,
      this.numeroPatrimonialAntigo,
      this.numeroPatrimonialNovo,
      this.nomeUsuarioColeta,
      this.tipoMobile,
      this.novoBemInvetariado,
      this.enviado,
      this.bemNaoEncontrado,
      this.bemNaoInventariado,
      this.caracteristicas,
      this.material,
      this.dominioSituacaoFisica,
      this.dominioStatus,
      this.dominioStatusInventarioBem});
  factory InventarioBemPatrimonialDBData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return InventarioBemPatrimonialDBData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idDadosBemPatrimonialMobile: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}id_dados_bem_patrimonial_mobile']),
      idInventarioEstruturaOrganizacionalMobile:
          intType.mapFromDatabaseResponse(data[
              '${effectivePrefix}id_inventario_estrutura_organizacional_mobile']),
      idUnidadeOrganizacional: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}id_unidade_organizacional']),
      idDominioSituacaoFisica: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}id_dominio_situacao_fisica']),
      idDominioStatus: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_dominio_status']),
      identificaoPatrimonial: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}identificao_patrimonial']),
      idEstruturaOrganizacionalAtual: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}id_estrutura_organizacional_atual']),
      idMaterial: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_material']),
      numeroPatrimonial: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}numero_patrimonial']),
      numeroPatrimonialAntigo: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}numero_patrimonial_antigo']),
      numeroPatrimonialNovo: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}numero_patrimonial_novo']),
      nomeUsuarioColeta: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}nome_usuario_coleta']),
      tipoMobile: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}tipo_mobile']),
      novoBemInvetariado: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}novo_bem_invetariado']),
      enviado:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}enviado']),
      bemNaoEncontrado: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}bem_nao_encontrado']),
      bemNaoInventariado: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}bem_nao_inventariado']),
      caracteristicas: $InventarioBemPatrimonialDBTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}caracteristicas'])),
      material: $InventarioBemPatrimonialDBTable.$converter1.mapToDart(
          stringType
              .mapFromDatabaseResponse(data['${effectivePrefix}material'])),
      dominioSituacaoFisica: $InventarioBemPatrimonialDBTable.$converter2
          .mapToDart(stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}dominio_situacao_fisica'])),
      dominioStatus: $InventarioBemPatrimonialDBTable.$converter3.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}dominio_status'])),
      dominioStatusInventarioBem: $InventarioBemPatrimonialDBTable.$converter4
          .mapToDart(stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}dominio_status_inventario_bem'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idDadosBemPatrimonialMobile != null) {
      map['id_dados_bem_patrimonial_mobile'] =
          Variable<int>(idDadosBemPatrimonialMobile);
    }
    if (!nullToAbsent || idInventarioEstruturaOrganizacionalMobile != null) {
      map['id_inventario_estrutura_organizacional_mobile'] =
          Variable<int>(idInventarioEstruturaOrganizacionalMobile);
    }
    if (!nullToAbsent || idUnidadeOrganizacional != null) {
      map['id_unidade_organizacional'] = Variable<int>(idUnidadeOrganizacional);
    }
    if (!nullToAbsent || idDominioSituacaoFisica != null) {
      map['id_dominio_situacao_fisica'] =
          Variable<int>(idDominioSituacaoFisica);
    }
    if (!nullToAbsent || idDominioStatus != null) {
      map['id_dominio_status'] = Variable<int>(idDominioStatus);
    }
    if (!nullToAbsent || identificaoPatrimonial != null) {
      map['identificao_patrimonial'] = Variable<int>(identificaoPatrimonial);
    }
    if (!nullToAbsent || idEstruturaOrganizacionalAtual != null) {
      map['id_estrutura_organizacional_atual'] =
          Variable<int>(idEstruturaOrganizacionalAtual);
    }
    if (!nullToAbsent || idMaterial != null) {
      map['id_material'] = Variable<int>(idMaterial);
    }
    if (!nullToAbsent || numeroPatrimonial != null) {
      map['numero_patrimonial'] = Variable<String>(numeroPatrimonial);
    }
    if (!nullToAbsent || numeroPatrimonialAntigo != null) {
      map['numero_patrimonial_antigo'] =
          Variable<String>(numeroPatrimonialAntigo);
    }
    if (!nullToAbsent || numeroPatrimonialNovo != null) {
      map['numero_patrimonial_novo'] = Variable<String>(numeroPatrimonialNovo);
    }
    if (!nullToAbsent || nomeUsuarioColeta != null) {
      map['nome_usuario_coleta'] = Variable<String>(nomeUsuarioColeta);
    }
    if (!nullToAbsent || tipoMobile != null) {
      map['tipo_mobile'] = Variable<String>(tipoMobile);
    }
    if (!nullToAbsent || novoBemInvetariado != null) {
      map['novo_bem_invetariado'] = Variable<bool>(novoBemInvetariado);
    }
    if (!nullToAbsent || enviado != null) {
      map['enviado'] = Variable<bool>(enviado);
    }
    if (!nullToAbsent || bemNaoEncontrado != null) {
      map['bem_nao_encontrado'] = Variable<bool>(bemNaoEncontrado);
    }
    if (!nullToAbsent || bemNaoInventariado != null) {
      map['bem_nao_inventariado'] = Variable<bool>(bemNaoInventariado);
    }
    if (!nullToAbsent || caracteristicas != null) {
      final converter = $InventarioBemPatrimonialDBTable.$converter0;
      map['caracteristicas'] =
          Variable<String>(converter.mapToSql(caracteristicas));
    }
    if (!nullToAbsent || material != null) {
      final converter = $InventarioBemPatrimonialDBTable.$converter1;
      map['material'] = Variable<String>(converter.mapToSql(material));
    }
    if (!nullToAbsent || dominioSituacaoFisica != null) {
      final converter = $InventarioBemPatrimonialDBTable.$converter2;
      map['dominio_situacao_fisica'] =
          Variable<String>(converter.mapToSql(dominioSituacaoFisica));
    }
    if (!nullToAbsent || dominioStatus != null) {
      final converter = $InventarioBemPatrimonialDBTable.$converter3;
      map['dominio_status'] =
          Variable<String>(converter.mapToSql(dominioStatus));
    }
    if (!nullToAbsent || dominioStatusInventarioBem != null) {
      final converter = $InventarioBemPatrimonialDBTable.$converter4;
      map['dominio_status_inventario_bem'] =
          Variable<String>(converter.mapToSql(dominioStatusInventarioBem));
    }
    return map;
  }

  InventarioBemPatrimonialDBCompanion toCompanion(bool nullToAbsent) {
    return InventarioBemPatrimonialDBCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idDadosBemPatrimonialMobile:
          idDadosBemPatrimonialMobile == null && nullToAbsent
              ? const Value.absent()
              : Value(idDadosBemPatrimonialMobile),
      idInventarioEstruturaOrganizacionalMobile:
          idInventarioEstruturaOrganizacionalMobile == null && nullToAbsent
              ? const Value.absent()
              : Value(idInventarioEstruturaOrganizacionalMobile),
      idUnidadeOrganizacional: idUnidadeOrganizacional == null && nullToAbsent
          ? const Value.absent()
          : Value(idUnidadeOrganizacional),
      idDominioSituacaoFisica: idDominioSituacaoFisica == null && nullToAbsent
          ? const Value.absent()
          : Value(idDominioSituacaoFisica),
      idDominioStatus: idDominioStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(idDominioStatus),
      identificaoPatrimonial: identificaoPatrimonial == null && nullToAbsent
          ? const Value.absent()
          : Value(identificaoPatrimonial),
      idEstruturaOrganizacionalAtual:
          idEstruturaOrganizacionalAtual == null && nullToAbsent
              ? const Value.absent()
              : Value(idEstruturaOrganizacionalAtual),
      idMaterial: idMaterial == null && nullToAbsent
          ? const Value.absent()
          : Value(idMaterial),
      numeroPatrimonial: numeroPatrimonial == null && nullToAbsent
          ? const Value.absent()
          : Value(numeroPatrimonial),
      numeroPatrimonialAntigo: numeroPatrimonialAntigo == null && nullToAbsent
          ? const Value.absent()
          : Value(numeroPatrimonialAntigo),
      numeroPatrimonialNovo: numeroPatrimonialNovo == null && nullToAbsent
          ? const Value.absent()
          : Value(numeroPatrimonialNovo),
      nomeUsuarioColeta: nomeUsuarioColeta == null && nullToAbsent
          ? const Value.absent()
          : Value(nomeUsuarioColeta),
      tipoMobile: tipoMobile == null && nullToAbsent
          ? const Value.absent()
          : Value(tipoMobile),
      novoBemInvetariado: novoBemInvetariado == null && nullToAbsent
          ? const Value.absent()
          : Value(novoBemInvetariado),
      enviado: enviado == null && nullToAbsent
          ? const Value.absent()
          : Value(enviado),
      bemNaoEncontrado: bemNaoEncontrado == null && nullToAbsent
          ? const Value.absent()
          : Value(bemNaoEncontrado),
      bemNaoInventariado: bemNaoInventariado == null && nullToAbsent
          ? const Value.absent()
          : Value(bemNaoInventariado),
      caracteristicas: caracteristicas == null && nullToAbsent
          ? const Value.absent()
          : Value(caracteristicas),
      material: material == null && nullToAbsent
          ? const Value.absent()
          : Value(material),
      dominioSituacaoFisica: dominioSituacaoFisica == null && nullToAbsent
          ? const Value.absent()
          : Value(dominioSituacaoFisica),
      dominioStatus: dominioStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(dominioStatus),
      dominioStatusInventarioBem:
          dominioStatusInventarioBem == null && nullToAbsent
              ? const Value.absent()
              : Value(dominioStatusInventarioBem),
    );
  }

  factory InventarioBemPatrimonialDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return InventarioBemPatrimonialDBData(
      id: serializer.fromJson<int>(json['id']),
      idDadosBemPatrimonialMobile:
          serializer.fromJson<int>(json['idDadosBemPatrimonialMobile']),
      idInventarioEstruturaOrganizacionalMobile: serializer
          .fromJson<int>(json['idInventarioEstruturaOrganizacionalMobile']),
      idUnidadeOrganizacional:
          serializer.fromJson<int>(json['idUnidadeOrganizacional']),
      idDominioSituacaoFisica:
          serializer.fromJson<int>(json['idDominioSituacaoFisica']),
      idDominioStatus: serializer.fromJson<int>(json['idDominioStatus']),
      identificaoPatrimonial:
          serializer.fromJson<int>(json['identificaoPatrimonial']),
      idEstruturaOrganizacionalAtual:
          serializer.fromJson<int>(json['idEstruturaOrganizacionalAtual']),
      idMaterial: serializer.fromJson<int>(json['idMaterial']),
      numeroPatrimonial: serializer.fromJson<String>(json['numeroPatrimonial']),
      numeroPatrimonialAntigo:
          serializer.fromJson<String>(json['numeroPatrimonialAntigo']),
      numeroPatrimonialNovo:
          serializer.fromJson<String>(json['numeroPatrimonialNovo']),
      nomeUsuarioColeta: serializer.fromJson<String>(json['nomeUsuarioColeta']),
      tipoMobile: serializer.fromJson<String>(json['tipoMobile']),
      novoBemInvetariado: serializer.fromJson<bool>(json['novoBemInvetariado']),
      enviado: serializer.fromJson<bool>(json['enviado']),
      bemNaoEncontrado: serializer.fromJson<bool>(json['bemNaoEncontrado']),
      bemNaoInventariado: serializer.fromJson<bool>(json['bemNaoInventariado']),
      caracteristicas:
          serializer.fromJson<List<Caracteristicas>>(json['caracteristicas']),
      material: serializer.fromJson<Material>(json['material']),
      dominioSituacaoFisica:
          serializer.fromJson<Dominio>(json['dominioSituacaoFisica']),
      dominioStatus: serializer.fromJson<Dominio>(json['dominioStatus']),
      dominioStatusInventarioBem:
          serializer.fromJson<Dominio>(json['dominioStatusInventarioBem']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idDadosBemPatrimonialMobile':
          serializer.toJson<int>(idDadosBemPatrimonialMobile),
      'idInventarioEstruturaOrganizacionalMobile':
          serializer.toJson<int>(idInventarioEstruturaOrganizacionalMobile),
      'idUnidadeOrganizacional':
          serializer.toJson<int>(idUnidadeOrganizacional),
      'idDominioSituacaoFisica':
          serializer.toJson<int>(idDominioSituacaoFisica),
      'idDominioStatus': serializer.toJson<int>(idDominioStatus),
      'identificaoPatrimonial': serializer.toJson<int>(identificaoPatrimonial),
      'idEstruturaOrganizacionalAtual':
          serializer.toJson<int>(idEstruturaOrganizacionalAtual),
      'idMaterial': serializer.toJson<int>(idMaterial),
      'numeroPatrimonial': serializer.toJson<String>(numeroPatrimonial),
      'numeroPatrimonialAntigo':
          serializer.toJson<String>(numeroPatrimonialAntigo),
      'numeroPatrimonialNovo': serializer.toJson<String>(numeroPatrimonialNovo),
      'nomeUsuarioColeta': serializer.toJson<String>(nomeUsuarioColeta),
      'tipoMobile': serializer.toJson<String>(tipoMobile),
      'novoBemInvetariado': serializer.toJson<bool>(novoBemInvetariado),
      'enviado': serializer.toJson<bool>(enviado),
      'bemNaoEncontrado': serializer.toJson<bool>(bemNaoEncontrado),
      'bemNaoInventariado': serializer.toJson<bool>(bemNaoInventariado),
      'caracteristicas':
          serializer.toJson<List<Caracteristicas>>(caracteristicas),
      'material': serializer.toJson<Material>(material),
      'dominioSituacaoFisica':
          serializer.toJson<Dominio>(dominioSituacaoFisica),
      'dominioStatus': serializer.toJson<Dominio>(dominioStatus),
      'dominioStatusInventarioBem':
          serializer.toJson<Dominio>(dominioStatusInventarioBem),
    };
  }

  InventarioBemPatrimonialDBData copyWith(
          {int id,
          int idDadosBemPatrimonialMobile,
          int idInventarioEstruturaOrganizacionalMobile,
          int idUnidadeOrganizacional,
          int idDominioSituacaoFisica,
          int idDominioStatus,
          int identificaoPatrimonial,
          int idEstruturaOrganizacionalAtual,
          int idMaterial,
          String numeroPatrimonial,
          String numeroPatrimonialAntigo,
          String numeroPatrimonialNovo,
          String nomeUsuarioColeta,
          String tipoMobile,
          bool novoBemInvetariado,
          bool enviado,
          bool bemNaoEncontrado,
          bool bemNaoInventariado,
          List<Caracteristicas> caracteristicas,
          Material material,
          Dominio dominioSituacaoFisica,
          Dominio dominioStatus,
          Dominio dominioStatusInventarioBem}) =>
      InventarioBemPatrimonialDBData(
        id: id ?? this.id,
        idDadosBemPatrimonialMobile:
            idDadosBemPatrimonialMobile ?? this.idDadosBemPatrimonialMobile,
        idInventarioEstruturaOrganizacionalMobile:
            idInventarioEstruturaOrganizacionalMobile ??
                this.idInventarioEstruturaOrganizacionalMobile,
        idUnidadeOrganizacional:
            idUnidadeOrganizacional ?? this.idUnidadeOrganizacional,
        idDominioSituacaoFisica:
            idDominioSituacaoFisica ?? this.idDominioSituacaoFisica,
        idDominioStatus: idDominioStatus ?? this.idDominioStatus,
        identificaoPatrimonial:
            identificaoPatrimonial ?? this.identificaoPatrimonial,
        idEstruturaOrganizacionalAtual: idEstruturaOrganizacionalAtual ??
            this.idEstruturaOrganizacionalAtual,
        idMaterial: idMaterial ?? this.idMaterial,
        numeroPatrimonial: numeroPatrimonial ?? this.numeroPatrimonial,
        numeroPatrimonialAntigo:
            numeroPatrimonialAntigo ?? this.numeroPatrimonialAntigo,
        numeroPatrimonialNovo:
            numeroPatrimonialNovo ?? this.numeroPatrimonialNovo,
        nomeUsuarioColeta: nomeUsuarioColeta ?? this.nomeUsuarioColeta,
        tipoMobile: tipoMobile ?? this.tipoMobile,
        novoBemInvetariado: novoBemInvetariado ?? this.novoBemInvetariado,
        enviado: enviado ?? this.enviado,
        bemNaoEncontrado: bemNaoEncontrado ?? this.bemNaoEncontrado,
        bemNaoInventariado: bemNaoInventariado ?? this.bemNaoInventariado,
        caracteristicas: caracteristicas ?? this.caracteristicas,
        material: material ?? this.material,
        dominioSituacaoFisica:
            dominioSituacaoFisica ?? this.dominioSituacaoFisica,
        dominioStatus: dominioStatus ?? this.dominioStatus,
        dominioStatusInventarioBem:
            dominioStatusInventarioBem ?? this.dominioStatusInventarioBem,
      );
  @override
  String toString() {
    return (StringBuffer('InventarioBemPatrimonialDBData(')
          ..write('id: $id, ')
          ..write('idDadosBemPatrimonialMobile: $idDadosBemPatrimonialMobile, ')
          ..write(
              'idInventarioEstruturaOrganizacionalMobile: $idInventarioEstruturaOrganizacionalMobile, ')
          ..write('idUnidadeOrganizacional: $idUnidadeOrganizacional, ')
          ..write('idDominioSituacaoFisica: $idDominioSituacaoFisica, ')
          ..write('idDominioStatus: $idDominioStatus, ')
          ..write('identificaoPatrimonial: $identificaoPatrimonial, ')
          ..write(
              'idEstruturaOrganizacionalAtual: $idEstruturaOrganizacionalAtual, ')
          ..write('idMaterial: $idMaterial, ')
          ..write('numeroPatrimonial: $numeroPatrimonial, ')
          ..write('numeroPatrimonialAntigo: $numeroPatrimonialAntigo, ')
          ..write('numeroPatrimonialNovo: $numeroPatrimonialNovo, ')
          ..write('nomeUsuarioColeta: $nomeUsuarioColeta, ')
          ..write('tipoMobile: $tipoMobile, ')
          ..write('novoBemInvetariado: $novoBemInvetariado, ')
          ..write('enviado: $enviado, ')
          ..write('bemNaoEncontrado: $bemNaoEncontrado, ')
          ..write('bemNaoInventariado: $bemNaoInventariado, ')
          ..write('caracteristicas: $caracteristicas, ')
          ..write('material: $material, ')
          ..write('dominioSituacaoFisica: $dominioSituacaoFisica, ')
          ..write('dominioStatus: $dominioStatus, ')
          ..write('dominioStatusInventarioBem: $dominioStatusInventarioBem')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idDadosBemPatrimonialMobile.hashCode,
          $mrjc(
              idInventarioEstruturaOrganizacionalMobile.hashCode,
              $mrjc(
                  idUnidadeOrganizacional.hashCode,
                  $mrjc(
                      idDominioSituacaoFisica.hashCode,
                      $mrjc(
                          idDominioStatus.hashCode,
                          $mrjc(
                              identificaoPatrimonial.hashCode,
                              $mrjc(
                                  idEstruturaOrganizacionalAtual.hashCode,
                                  $mrjc(
                                      idMaterial.hashCode,
                                      $mrjc(
                                          numeroPatrimonial.hashCode,
                                          $mrjc(
                                              numeroPatrimonialAntigo.hashCode,
                                              $mrjc(
                                                  numeroPatrimonialNovo
                                                      .hashCode,
                                                  $mrjc(
                                                      nomeUsuarioColeta
                                                          .hashCode,
                                                      $mrjc(
                                                          tipoMobile.hashCode,
                                                          $mrjc(
                                                              novoBemInvetariado
                                                                  .hashCode,
                                                              $mrjc(
                                                                  enviado
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      bemNaoEncontrado
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          bemNaoInventariado
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              caracteristicas.hashCode,
                                                                              $mrjc(material.hashCode, $mrjc(dominioSituacaoFisica.hashCode, $mrjc(dominioStatus.hashCode, dominioStatusInventarioBem.hashCode)))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is InventarioBemPatrimonialDBData &&
          other.id == this.id &&
          other.idDadosBemPatrimonialMobile ==
              this.idDadosBemPatrimonialMobile &&
          other.idInventarioEstruturaOrganizacionalMobile ==
              this.idInventarioEstruturaOrganizacionalMobile &&
          other.idUnidadeOrganizacional == this.idUnidadeOrganizacional &&
          other.idDominioSituacaoFisica == this.idDominioSituacaoFisica &&
          other.idDominioStatus == this.idDominioStatus &&
          other.identificaoPatrimonial == this.identificaoPatrimonial &&
          other.idEstruturaOrganizacionalAtual ==
              this.idEstruturaOrganizacionalAtual &&
          other.idMaterial == this.idMaterial &&
          other.numeroPatrimonial == this.numeroPatrimonial &&
          other.numeroPatrimonialAntigo == this.numeroPatrimonialAntigo &&
          other.numeroPatrimonialNovo == this.numeroPatrimonialNovo &&
          other.nomeUsuarioColeta == this.nomeUsuarioColeta &&
          other.tipoMobile == this.tipoMobile &&
          other.novoBemInvetariado == this.novoBemInvetariado &&
          other.enviado == this.enviado &&
          other.bemNaoEncontrado == this.bemNaoEncontrado &&
          other.bemNaoInventariado == this.bemNaoInventariado &&
          other.caracteristicas == this.caracteristicas &&
          other.material == this.material &&
          other.dominioSituacaoFisica == this.dominioSituacaoFisica &&
          other.dominioStatus == this.dominioStatus &&
          other.dominioStatusInventarioBem == this.dominioStatusInventarioBem);
}

class InventarioBemPatrimonialDBCompanion
    extends UpdateCompanion<InventarioBemPatrimonialDBData> {
  final Value<int> id;
  final Value<int> idDadosBemPatrimonialMobile;
  final Value<int> idInventarioEstruturaOrganizacionalMobile;
  final Value<int> idUnidadeOrganizacional;
  final Value<int> idDominioSituacaoFisica;
  final Value<int> idDominioStatus;
  final Value<int> identificaoPatrimonial;
  final Value<int> idEstruturaOrganizacionalAtual;
  final Value<int> idMaterial;
  final Value<String> numeroPatrimonial;
  final Value<String> numeroPatrimonialAntigo;
  final Value<String> numeroPatrimonialNovo;
  final Value<String> nomeUsuarioColeta;
  final Value<String> tipoMobile;
  final Value<bool> novoBemInvetariado;
  final Value<bool> enviado;
  final Value<bool> bemNaoEncontrado;
  final Value<bool> bemNaoInventariado;
  final Value<List<Caracteristicas>> caracteristicas;
  final Value<Material> material;
  final Value<Dominio> dominioSituacaoFisica;
  final Value<Dominio> dominioStatus;
  final Value<Dominio> dominioStatusInventarioBem;
  const InventarioBemPatrimonialDBCompanion({
    this.id = const Value.absent(),
    this.idDadosBemPatrimonialMobile = const Value.absent(),
    this.idInventarioEstruturaOrganizacionalMobile = const Value.absent(),
    this.idUnidadeOrganizacional = const Value.absent(),
    this.idDominioSituacaoFisica = const Value.absent(),
    this.idDominioStatus = const Value.absent(),
    this.identificaoPatrimonial = const Value.absent(),
    this.idEstruturaOrganizacionalAtual = const Value.absent(),
    this.idMaterial = const Value.absent(),
    this.numeroPatrimonial = const Value.absent(),
    this.numeroPatrimonialAntigo = const Value.absent(),
    this.numeroPatrimonialNovo = const Value.absent(),
    this.nomeUsuarioColeta = const Value.absent(),
    this.tipoMobile = const Value.absent(),
    this.novoBemInvetariado = const Value.absent(),
    this.enviado = const Value.absent(),
    this.bemNaoEncontrado = const Value.absent(),
    this.bemNaoInventariado = const Value.absent(),
    this.caracteristicas = const Value.absent(),
    this.material = const Value.absent(),
    this.dominioSituacaoFisica = const Value.absent(),
    this.dominioStatus = const Value.absent(),
    this.dominioStatusInventarioBem = const Value.absent(),
  });
  InventarioBemPatrimonialDBCompanion.insert({
    this.id = const Value.absent(),
    this.idDadosBemPatrimonialMobile = const Value.absent(),
    this.idInventarioEstruturaOrganizacionalMobile = const Value.absent(),
    this.idUnidadeOrganizacional = const Value.absent(),
    this.idDominioSituacaoFisica = const Value.absent(),
    this.idDominioStatus = const Value.absent(),
    this.identificaoPatrimonial = const Value.absent(),
    this.idEstruturaOrganizacionalAtual = const Value.absent(),
    this.idMaterial = const Value.absent(),
    this.numeroPatrimonial = const Value.absent(),
    this.numeroPatrimonialAntigo = const Value.absent(),
    this.numeroPatrimonialNovo = const Value.absent(),
    this.nomeUsuarioColeta = const Value.absent(),
    this.tipoMobile = const Value.absent(),
    this.novoBemInvetariado = const Value.absent(),
    this.enviado = const Value.absent(),
    this.bemNaoEncontrado = const Value.absent(),
    this.bemNaoInventariado = const Value.absent(),
    this.caracteristicas = const Value.absent(),
    this.material = const Value.absent(),
    this.dominioSituacaoFisica = const Value.absent(),
    this.dominioStatus = const Value.absent(),
    this.dominioStatusInventarioBem = const Value.absent(),
  });
  static Insertable<InventarioBemPatrimonialDBData> custom({
    Expression<int> id,
    Expression<int> idDadosBemPatrimonialMobile,
    Expression<int> idInventarioEstruturaOrganizacionalMobile,
    Expression<int> idUnidadeOrganizacional,
    Expression<int> idDominioSituacaoFisica,
    Expression<int> idDominioStatus,
    Expression<int> identificaoPatrimonial,
    Expression<int> idEstruturaOrganizacionalAtual,
    Expression<int> idMaterial,
    Expression<String> numeroPatrimonial,
    Expression<String> numeroPatrimonialAntigo,
    Expression<String> numeroPatrimonialNovo,
    Expression<String> nomeUsuarioColeta,
    Expression<String> tipoMobile,
    Expression<bool> novoBemInvetariado,
    Expression<bool> enviado,
    Expression<bool> bemNaoEncontrado,
    Expression<bool> bemNaoInventariado,
    Expression<String> caracteristicas,
    Expression<String> material,
    Expression<String> dominioSituacaoFisica,
    Expression<String> dominioStatus,
    Expression<String> dominioStatusInventarioBem,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idDadosBemPatrimonialMobile != null)
        'id_dados_bem_patrimonial_mobile': idDadosBemPatrimonialMobile,
      if (idInventarioEstruturaOrganizacionalMobile != null)
        'id_inventario_estrutura_organizacional_mobile':
            idInventarioEstruturaOrganizacionalMobile,
      if (idUnidadeOrganizacional != null)
        'id_unidade_organizacional': idUnidadeOrganizacional,
      if (idDominioSituacaoFisica != null)
        'id_dominio_situacao_fisica': idDominioSituacaoFisica,
      if (idDominioStatus != null) 'id_dominio_status': idDominioStatus,
      if (identificaoPatrimonial != null)
        'identificao_patrimonial': identificaoPatrimonial,
      if (idEstruturaOrganizacionalAtual != null)
        'id_estrutura_organizacional_atual': idEstruturaOrganizacionalAtual,
      if (idMaterial != null) 'id_material': idMaterial,
      if (numeroPatrimonial != null) 'numero_patrimonial': numeroPatrimonial,
      if (numeroPatrimonialAntigo != null)
        'numero_patrimonial_antigo': numeroPatrimonialAntigo,
      if (numeroPatrimonialNovo != null)
        'numero_patrimonial_novo': numeroPatrimonialNovo,
      if (nomeUsuarioColeta != null) 'nome_usuario_coleta': nomeUsuarioColeta,
      if (tipoMobile != null) 'tipo_mobile': tipoMobile,
      if (novoBemInvetariado != null)
        'novo_bem_invetariado': novoBemInvetariado,
      if (enviado != null) 'enviado': enviado,
      if (bemNaoEncontrado != null) 'bem_nao_encontrado': bemNaoEncontrado,
      if (bemNaoInventariado != null)
        'bem_nao_inventariado': bemNaoInventariado,
      if (caracteristicas != null) 'caracteristicas': caracteristicas,
      if (material != null) 'material': material,
      if (dominioSituacaoFisica != null)
        'dominio_situacao_fisica': dominioSituacaoFisica,
      if (dominioStatus != null) 'dominio_status': dominioStatus,
      if (dominioStatusInventarioBem != null)
        'dominio_status_inventario_bem': dominioStatusInventarioBem,
    });
  }

  InventarioBemPatrimonialDBCompanion copyWith(
      {Value<int> id,
      Value<int> idDadosBemPatrimonialMobile,
      Value<int> idInventarioEstruturaOrganizacionalMobile,
      Value<int> idUnidadeOrganizacional,
      Value<int> idDominioSituacaoFisica,
      Value<int> idDominioStatus,
      Value<int> identificaoPatrimonial,
      Value<int> idEstruturaOrganizacionalAtual,
      Value<int> idMaterial,
      Value<String> numeroPatrimonial,
      Value<String> numeroPatrimonialAntigo,
      Value<String> numeroPatrimonialNovo,
      Value<String> nomeUsuarioColeta,
      Value<String> tipoMobile,
      Value<bool> novoBemInvetariado,
      Value<bool> enviado,
      Value<bool> bemNaoEncontrado,
      Value<bool> bemNaoInventariado,
      Value<List<Caracteristicas>> caracteristicas,
      Value<Material> material,
      Value<Dominio> dominioSituacaoFisica,
      Value<Dominio> dominioStatus,
      Value<Dominio> dominioStatusInventarioBem}) {
    return InventarioBemPatrimonialDBCompanion(
      id: id ?? this.id,
      idDadosBemPatrimonialMobile:
          idDadosBemPatrimonialMobile ?? this.idDadosBemPatrimonialMobile,
      idInventarioEstruturaOrganizacionalMobile:
          idInventarioEstruturaOrganizacionalMobile ??
              this.idInventarioEstruturaOrganizacionalMobile,
      idUnidadeOrganizacional:
          idUnidadeOrganizacional ?? this.idUnidadeOrganizacional,
      idDominioSituacaoFisica:
          idDominioSituacaoFisica ?? this.idDominioSituacaoFisica,
      idDominioStatus: idDominioStatus ?? this.idDominioStatus,
      identificaoPatrimonial:
          identificaoPatrimonial ?? this.identificaoPatrimonial,
      idEstruturaOrganizacionalAtual:
          idEstruturaOrganizacionalAtual ?? this.idEstruturaOrganizacionalAtual,
      idMaterial: idMaterial ?? this.idMaterial,
      numeroPatrimonial: numeroPatrimonial ?? this.numeroPatrimonial,
      numeroPatrimonialAntigo:
          numeroPatrimonialAntigo ?? this.numeroPatrimonialAntigo,
      numeroPatrimonialNovo:
          numeroPatrimonialNovo ?? this.numeroPatrimonialNovo,
      nomeUsuarioColeta: nomeUsuarioColeta ?? this.nomeUsuarioColeta,
      tipoMobile: tipoMobile ?? this.tipoMobile,
      novoBemInvetariado: novoBemInvetariado ?? this.novoBemInvetariado,
      enviado: enviado ?? this.enviado,
      bemNaoEncontrado: bemNaoEncontrado ?? this.bemNaoEncontrado,
      bemNaoInventariado: bemNaoInventariado ?? this.bemNaoInventariado,
      caracteristicas: caracteristicas ?? this.caracteristicas,
      material: material ?? this.material,
      dominioSituacaoFisica:
          dominioSituacaoFisica ?? this.dominioSituacaoFisica,
      dominioStatus: dominioStatus ?? this.dominioStatus,
      dominioStatusInventarioBem:
          dominioStatusInventarioBem ?? this.dominioStatusInventarioBem,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idDadosBemPatrimonialMobile.present) {
      map['id_dados_bem_patrimonial_mobile'] =
          Variable<int>(idDadosBemPatrimonialMobile.value);
    }
    if (idInventarioEstruturaOrganizacionalMobile.present) {
      map['id_inventario_estrutura_organizacional_mobile'] =
          Variable<int>(idInventarioEstruturaOrganizacionalMobile.value);
    }
    if (idUnidadeOrganizacional.present) {
      map['id_unidade_organizacional'] =
          Variable<int>(idUnidadeOrganizacional.value);
    }
    if (idDominioSituacaoFisica.present) {
      map['id_dominio_situacao_fisica'] =
          Variable<int>(idDominioSituacaoFisica.value);
    }
    if (idDominioStatus.present) {
      map['id_dominio_status'] = Variable<int>(idDominioStatus.value);
    }
    if (identificaoPatrimonial.present) {
      map['identificao_patrimonial'] =
          Variable<int>(identificaoPatrimonial.value);
    }
    if (idEstruturaOrganizacionalAtual.present) {
      map['id_estrutura_organizacional_atual'] =
          Variable<int>(idEstruturaOrganizacionalAtual.value);
    }
    if (idMaterial.present) {
      map['id_material'] = Variable<int>(idMaterial.value);
    }
    if (numeroPatrimonial.present) {
      map['numero_patrimonial'] = Variable<String>(numeroPatrimonial.value);
    }
    if (numeroPatrimonialAntigo.present) {
      map['numero_patrimonial_antigo'] =
          Variable<String>(numeroPatrimonialAntigo.value);
    }
    if (numeroPatrimonialNovo.present) {
      map['numero_patrimonial_novo'] =
          Variable<String>(numeroPatrimonialNovo.value);
    }
    if (nomeUsuarioColeta.present) {
      map['nome_usuario_coleta'] = Variable<String>(nomeUsuarioColeta.value);
    }
    if (tipoMobile.present) {
      map['tipo_mobile'] = Variable<String>(tipoMobile.value);
    }
    if (novoBemInvetariado.present) {
      map['novo_bem_invetariado'] = Variable<bool>(novoBemInvetariado.value);
    }
    if (enviado.present) {
      map['enviado'] = Variable<bool>(enviado.value);
    }
    if (bemNaoEncontrado.present) {
      map['bem_nao_encontrado'] = Variable<bool>(bemNaoEncontrado.value);
    }
    if (bemNaoInventariado.present) {
      map['bem_nao_inventariado'] = Variable<bool>(bemNaoInventariado.value);
    }
    if (caracteristicas.present) {
      final converter = $InventarioBemPatrimonialDBTable.$converter0;
      map['caracteristicas'] =
          Variable<String>(converter.mapToSql(caracteristicas.value));
    }
    if (material.present) {
      final converter = $InventarioBemPatrimonialDBTable.$converter1;
      map['material'] = Variable<String>(converter.mapToSql(material.value));
    }
    if (dominioSituacaoFisica.present) {
      final converter = $InventarioBemPatrimonialDBTable.$converter2;
      map['dominio_situacao_fisica'] =
          Variable<String>(converter.mapToSql(dominioSituacaoFisica.value));
    }
    if (dominioStatus.present) {
      final converter = $InventarioBemPatrimonialDBTable.$converter3;
      map['dominio_status'] =
          Variable<String>(converter.mapToSql(dominioStatus.value));
    }
    if (dominioStatusInventarioBem.present) {
      final converter = $InventarioBemPatrimonialDBTable.$converter4;
      map['dominio_status_inventario_bem'] = Variable<String>(
          converter.mapToSql(dominioStatusInventarioBem.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventarioBemPatrimonialDBCompanion(')
          ..write('id: $id, ')
          ..write('idDadosBemPatrimonialMobile: $idDadosBemPatrimonialMobile, ')
          ..write(
              'idInventarioEstruturaOrganizacionalMobile: $idInventarioEstruturaOrganizacionalMobile, ')
          ..write('idUnidadeOrganizacional: $idUnidadeOrganizacional, ')
          ..write('idDominioSituacaoFisica: $idDominioSituacaoFisica, ')
          ..write('idDominioStatus: $idDominioStatus, ')
          ..write('identificaoPatrimonial: $identificaoPatrimonial, ')
          ..write(
              'idEstruturaOrganizacionalAtual: $idEstruturaOrganizacionalAtual, ')
          ..write('idMaterial: $idMaterial, ')
          ..write('numeroPatrimonial: $numeroPatrimonial, ')
          ..write('numeroPatrimonialAntigo: $numeroPatrimonialAntigo, ')
          ..write('numeroPatrimonialNovo: $numeroPatrimonialNovo, ')
          ..write('nomeUsuarioColeta: $nomeUsuarioColeta, ')
          ..write('tipoMobile: $tipoMobile, ')
          ..write('novoBemInvetariado: $novoBemInvetariado, ')
          ..write('enviado: $enviado, ')
          ..write('bemNaoEncontrado: $bemNaoEncontrado, ')
          ..write('bemNaoInventariado: $bemNaoInventariado, ')
          ..write('caracteristicas: $caracteristicas, ')
          ..write('material: $material, ')
          ..write('dominioSituacaoFisica: $dominioSituacaoFisica, ')
          ..write('dominioStatus: $dominioStatus, ')
          ..write('dominioStatusInventarioBem: $dominioStatusInventarioBem')
          ..write(')'))
        .toString();
  }
}

class $InventarioBemPatrimonialDBTable extends InventarioBemPatrimonialDB
    with
        TableInfo<$InventarioBemPatrimonialDBTable,
            InventarioBemPatrimonialDBData> {
  final GeneratedDatabase _db;
  final String _alias;
  $InventarioBemPatrimonialDBTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idDadosBemPatrimonialMobileMeta =
      const VerificationMeta('idDadosBemPatrimonialMobile');
  GeneratedIntColumn _idDadosBemPatrimonialMobile;
  @override
  GeneratedIntColumn get idDadosBemPatrimonialMobile =>
      _idDadosBemPatrimonialMobile ??= _constructIdDadosBemPatrimonialMobile();
  GeneratedIntColumn _constructIdDadosBemPatrimonialMobile() {
    return GeneratedIntColumn(
      'id_dados_bem_patrimonial_mobile',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idInventarioEstruturaOrganizacionalMobileMeta =
      const VerificationMeta('idInventarioEstruturaOrganizacionalMobile');
  GeneratedIntColumn _idInventarioEstruturaOrganizacionalMobile;
  @override
  GeneratedIntColumn get idInventarioEstruturaOrganizacionalMobile =>
      _idInventarioEstruturaOrganizacionalMobile ??=
          _constructIdInventarioEstruturaOrganizacionalMobile();
  GeneratedIntColumn _constructIdInventarioEstruturaOrganizacionalMobile() {
    return GeneratedIntColumn(
      'id_inventario_estrutura_organizacional_mobile',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idUnidadeOrganizacionalMeta =
      const VerificationMeta('idUnidadeOrganizacional');
  GeneratedIntColumn _idUnidadeOrganizacional;
  @override
  GeneratedIntColumn get idUnidadeOrganizacional =>
      _idUnidadeOrganizacional ??= _constructIdUnidadeOrganizacional();
  GeneratedIntColumn _constructIdUnidadeOrganizacional() {
    return GeneratedIntColumn(
      'id_unidade_organizacional',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idDominioSituacaoFisicaMeta =
      const VerificationMeta('idDominioSituacaoFisica');
  GeneratedIntColumn _idDominioSituacaoFisica;
  @override
  GeneratedIntColumn get idDominioSituacaoFisica =>
      _idDominioSituacaoFisica ??= _constructIdDominioSituacaoFisica();
  GeneratedIntColumn _constructIdDominioSituacaoFisica() {
    return GeneratedIntColumn(
      'id_dominio_situacao_fisica',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idDominioStatusMeta =
      const VerificationMeta('idDominioStatus');
  GeneratedIntColumn _idDominioStatus;
  @override
  GeneratedIntColumn get idDominioStatus =>
      _idDominioStatus ??= _constructIdDominioStatus();
  GeneratedIntColumn _constructIdDominioStatus() {
    return GeneratedIntColumn(
      'id_dominio_status',
      $tableName,
      true,
    );
  }

  final VerificationMeta _identificaoPatrimonialMeta =
      const VerificationMeta('identificaoPatrimonial');
  GeneratedIntColumn _identificaoPatrimonial;
  @override
  GeneratedIntColumn get identificaoPatrimonial =>
      _identificaoPatrimonial ??= _constructIdentificaoPatrimonial();
  GeneratedIntColumn _constructIdentificaoPatrimonial() {
    return GeneratedIntColumn(
      'identificao_patrimonial',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idEstruturaOrganizacionalAtualMeta =
      const VerificationMeta('idEstruturaOrganizacionalAtual');
  GeneratedIntColumn _idEstruturaOrganizacionalAtual;
  @override
  GeneratedIntColumn get idEstruturaOrganizacionalAtual =>
      _idEstruturaOrganizacionalAtual ??=
          _constructIdEstruturaOrganizacionalAtual();
  GeneratedIntColumn _constructIdEstruturaOrganizacionalAtual() {
    return GeneratedIntColumn(
      'id_estrutura_organizacional_atual',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMaterialMeta = const VerificationMeta('idMaterial');
  GeneratedIntColumn _idMaterial;
  @override
  GeneratedIntColumn get idMaterial => _idMaterial ??= _constructIdMaterial();
  GeneratedIntColumn _constructIdMaterial() {
    return GeneratedIntColumn(
      'id_material',
      $tableName,
      true,
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

  final VerificationMeta _numeroPatrimonialAntigoMeta =
      const VerificationMeta('numeroPatrimonialAntigo');
  GeneratedTextColumn _numeroPatrimonialAntigo;
  @override
  GeneratedTextColumn get numeroPatrimonialAntigo =>
      _numeroPatrimonialAntigo ??= _constructNumeroPatrimonialAntigo();
  GeneratedTextColumn _constructNumeroPatrimonialAntigo() {
    return GeneratedTextColumn(
      'numero_patrimonial_antigo',
      $tableName,
      true,
    );
  }

  final VerificationMeta _numeroPatrimonialNovoMeta =
      const VerificationMeta('numeroPatrimonialNovo');
  GeneratedTextColumn _numeroPatrimonialNovo;
  @override
  GeneratedTextColumn get numeroPatrimonialNovo =>
      _numeroPatrimonialNovo ??= _constructNumeroPatrimonialNovo();
  GeneratedTextColumn _constructNumeroPatrimonialNovo() {
    return GeneratedTextColumn(
      'numero_patrimonial_novo',
      $tableName,
      true,
    );
  }

  final VerificationMeta _nomeUsuarioColetaMeta =
      const VerificationMeta('nomeUsuarioColeta');
  GeneratedTextColumn _nomeUsuarioColeta;
  @override
  GeneratedTextColumn get nomeUsuarioColeta =>
      _nomeUsuarioColeta ??= _constructNomeUsuarioColeta();
  GeneratedTextColumn _constructNomeUsuarioColeta() {
    return GeneratedTextColumn(
      'nome_usuario_coleta',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tipoMobileMeta = const VerificationMeta('tipoMobile');
  GeneratedTextColumn _tipoMobile;
  @override
  GeneratedTextColumn get tipoMobile => _tipoMobile ??= _constructTipoMobile();
  GeneratedTextColumn _constructTipoMobile() {
    return GeneratedTextColumn(
      'tipo_mobile',
      $tableName,
      true,
    );
  }

  final VerificationMeta _novoBemInvetariadoMeta =
      const VerificationMeta('novoBemInvetariado');
  GeneratedBoolColumn _novoBemInvetariado;
  @override
  GeneratedBoolColumn get novoBemInvetariado =>
      _novoBemInvetariado ??= _constructNovoBemInvetariado();
  GeneratedBoolColumn _constructNovoBemInvetariado() {
    return GeneratedBoolColumn(
      'novo_bem_invetariado',
      $tableName,
      true,
    );
  }

  final VerificationMeta _enviadoMeta = const VerificationMeta('enviado');
  GeneratedBoolColumn _enviado;
  @override
  GeneratedBoolColumn get enviado => _enviado ??= _constructEnviado();
  GeneratedBoolColumn _constructEnviado() {
    return GeneratedBoolColumn(
      'enviado',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bemNaoEncontradoMeta =
      const VerificationMeta('bemNaoEncontrado');
  GeneratedBoolColumn _bemNaoEncontrado;
  @override
  GeneratedBoolColumn get bemNaoEncontrado =>
      _bemNaoEncontrado ??= _constructBemNaoEncontrado();
  GeneratedBoolColumn _constructBemNaoEncontrado() {
    return GeneratedBoolColumn(
      'bem_nao_encontrado',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bemNaoInventariadoMeta =
      const VerificationMeta('bemNaoInventariado');
  GeneratedBoolColumn _bemNaoInventariado;
  @override
  GeneratedBoolColumn get bemNaoInventariado =>
      _bemNaoInventariado ??= _constructBemNaoInventariado();
  GeneratedBoolColumn _constructBemNaoInventariado() {
    return GeneratedBoolColumn(
      'bem_nao_inventariado',
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

  final VerificationMeta _dominioStatusInventarioBemMeta =
      const VerificationMeta('dominioStatusInventarioBem');
  GeneratedTextColumn _dominioStatusInventarioBem;
  @override
  GeneratedTextColumn get dominioStatusInventarioBem =>
      _dominioStatusInventarioBem ??= _constructDominioStatusInventarioBem();
  GeneratedTextColumn _constructDominioStatusInventarioBem() {
    return GeneratedTextColumn(
      'dominio_status_inventario_bem',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        idDadosBemPatrimonialMobile,
        idInventarioEstruturaOrganizacionalMobile,
        idUnidadeOrganizacional,
        idDominioSituacaoFisica,
        idDominioStatus,
        identificaoPatrimonial,
        idEstruturaOrganizacionalAtual,
        idMaterial,
        numeroPatrimonial,
        numeroPatrimonialAntigo,
        numeroPatrimonialNovo,
        nomeUsuarioColeta,
        tipoMobile,
        novoBemInvetariado,
        enviado,
        bemNaoEncontrado,
        bemNaoInventariado,
        caracteristicas,
        material,
        dominioSituacaoFisica,
        dominioStatus,
        dominioStatusInventarioBem
      ];
  @override
  $InventarioBemPatrimonialDBTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'inventario_bem_patrimonial_d_b';
  @override
  final String actualTableName = 'inventario_bem_patrimonial_d_b';
  @override
  VerificationContext validateIntegrity(
      Insertable<InventarioBemPatrimonialDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_dados_bem_patrimonial_mobile')) {
      context.handle(
          _idDadosBemPatrimonialMobileMeta,
          idDadosBemPatrimonialMobile.isAcceptableOrUnknown(
              data['id_dados_bem_patrimonial_mobile'],
              _idDadosBemPatrimonialMobileMeta));
    }
    if (data.containsKey('id_inventario_estrutura_organizacional_mobile')) {
      context.handle(
          _idInventarioEstruturaOrganizacionalMobileMeta,
          idInventarioEstruturaOrganizacionalMobile.isAcceptableOrUnknown(
              data['id_inventario_estrutura_organizacional_mobile'],
              _idInventarioEstruturaOrganizacionalMobileMeta));
    }
    if (data.containsKey('id_unidade_organizacional')) {
      context.handle(
          _idUnidadeOrganizacionalMeta,
          idUnidadeOrganizacional.isAcceptableOrUnknown(
              data['id_unidade_organizacional'], _idUnidadeOrganizacionalMeta));
    }
    if (data.containsKey('id_dominio_situacao_fisica')) {
      context.handle(
          _idDominioSituacaoFisicaMeta,
          idDominioSituacaoFisica.isAcceptableOrUnknown(
              data['id_dominio_situacao_fisica'],
              _idDominioSituacaoFisicaMeta));
    }
    if (data.containsKey('id_dominio_status')) {
      context.handle(
          _idDominioStatusMeta,
          idDominioStatus.isAcceptableOrUnknown(
              data['id_dominio_status'], _idDominioStatusMeta));
    }
    if (data.containsKey('identificao_patrimonial')) {
      context.handle(
          _identificaoPatrimonialMeta,
          identificaoPatrimonial.isAcceptableOrUnknown(
              data['identificao_patrimonial'], _identificaoPatrimonialMeta));
    }
    if (data.containsKey('id_estrutura_organizacional_atual')) {
      context.handle(
          _idEstruturaOrganizacionalAtualMeta,
          idEstruturaOrganizacionalAtual.isAcceptableOrUnknown(
              data['id_estrutura_organizacional_atual'],
              _idEstruturaOrganizacionalAtualMeta));
    }
    if (data.containsKey('id_material')) {
      context.handle(
          _idMaterialMeta,
          idMaterial.isAcceptableOrUnknown(
              data['id_material'], _idMaterialMeta));
    }
    if (data.containsKey('numero_patrimonial')) {
      context.handle(
          _numeroPatrimonialMeta,
          numeroPatrimonial.isAcceptableOrUnknown(
              data['numero_patrimonial'], _numeroPatrimonialMeta));
    }
    if (data.containsKey('numero_patrimonial_antigo')) {
      context.handle(
          _numeroPatrimonialAntigoMeta,
          numeroPatrimonialAntigo.isAcceptableOrUnknown(
              data['numero_patrimonial_antigo'], _numeroPatrimonialAntigoMeta));
    }
    if (data.containsKey('numero_patrimonial_novo')) {
      context.handle(
          _numeroPatrimonialNovoMeta,
          numeroPatrimonialNovo.isAcceptableOrUnknown(
              data['numero_patrimonial_novo'], _numeroPatrimonialNovoMeta));
    }
    if (data.containsKey('nome_usuario_coleta')) {
      context.handle(
          _nomeUsuarioColetaMeta,
          nomeUsuarioColeta.isAcceptableOrUnknown(
              data['nome_usuario_coleta'], _nomeUsuarioColetaMeta));
    }
    if (data.containsKey('tipo_mobile')) {
      context.handle(
          _tipoMobileMeta,
          tipoMobile.isAcceptableOrUnknown(
              data['tipo_mobile'], _tipoMobileMeta));
    }
    if (data.containsKey('novo_bem_invetariado')) {
      context.handle(
          _novoBemInvetariadoMeta,
          novoBemInvetariado.isAcceptableOrUnknown(
              data['novo_bem_invetariado'], _novoBemInvetariadoMeta));
    }
    if (data.containsKey('enviado')) {
      context.handle(_enviadoMeta,
          enviado.isAcceptableOrUnknown(data['enviado'], _enviadoMeta));
    }
    if (data.containsKey('bem_nao_encontrado')) {
      context.handle(
          _bemNaoEncontradoMeta,
          bemNaoEncontrado.isAcceptableOrUnknown(
              data['bem_nao_encontrado'], _bemNaoEncontradoMeta));
    }
    if (data.containsKey('bem_nao_inventariado')) {
      context.handle(
          _bemNaoInventariadoMeta,
          bemNaoInventariado.isAcceptableOrUnknown(
              data['bem_nao_inventariado'], _bemNaoInventariadoMeta));
    }
    context.handle(_caracteristicasMeta, const VerificationResult.success());
    context.handle(_materialMeta, const VerificationResult.success());
    context.handle(
        _dominioSituacaoFisicaMeta, const VerificationResult.success());
    context.handle(_dominioStatusMeta, const VerificationResult.success());
    context.handle(
        _dominioStatusInventarioBemMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {numeroPatrimonial};
  @override
  InventarioBemPatrimonialDBData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return InventarioBemPatrimonialDBData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  $InventarioBemPatrimonialDBTable createAlias(String alias) {
    return $InventarioBemPatrimonialDBTable(_db, alias);
  }

  static TypeConverter<List<Caracteristicas>, String> $converter0 =
      const CaracteristicasConverter();
  static TypeConverter<Material, String> $converter1 =
      const MaterialConverter();
  static TypeConverter<Dominio, String> $converter2 = const DominioConverter();
  static TypeConverter<Dominio, String> $converter3 = const DominioConverter();
  static TypeConverter<Dominio, String> $converter4 = const DominioConverter();
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DominioDBTable _dominioDB;
  $DominioDBTable get dominioDB => _dominioDB ??= $DominioDBTable(this);
  $BensPatrimoniaisDBTable _bensPatrimoniaisDB;
  $BensPatrimoniaisDBTable get bensPatrimoniaisDB =>
      _bensPatrimoniaisDB ??= $BensPatrimoniaisDBTable(this);
  $EstruturaInventarioDBTable _estruturaInventarioDB;
  $EstruturaInventarioDBTable get estruturaInventarioDB =>
      _estruturaInventarioDB ??= $EstruturaInventarioDBTable(this);
  $LevantamentoDBTable _levantamentoDB;
  $LevantamentoDBTable get levantamentoDB =>
      _levantamentoDB ??= $LevantamentoDBTable(this);
  $ConexaoDBTable _conexaoDB;
  $ConexaoDBTable get conexaoDB => _conexaoDB ??= $ConexaoDBTable(this);
  $UnidadesGestorasDBTable _unidadesGestorasDB;
  $UnidadesGestorasDBTable get unidadesGestorasDB =>
      _unidadesGestorasDB ??= $UnidadesGestorasDBTable(this);
  $DadosBemPatrimoniaisDBTable _dadosBemPatrimoniaisDB;
  $DadosBemPatrimoniaisDBTable get dadosBemPatrimoniaisDB =>
      _dadosBemPatrimoniaisDB ??= $DadosBemPatrimoniaisDBTable(this);
  $InventarioBemPatrimonialDBTable _inventarioBemPatrimonialDB;
  $InventarioBemPatrimonialDBTable get inventarioBemPatrimonialDB =>
      _inventarioBemPatrimonialDB ??= $InventarioBemPatrimonialDBTable(this);
  DominioDao _dominioDao;
  DominioDao get dominioDao => _dominioDao ??= DominioDao(this as AppDatabase);
  BemPatrimoniaisDao _bemPatrimoniaisDao;
  BemPatrimoniaisDao get bemPatrimoniaisDao =>
      _bemPatrimoniaisDao ??= BemPatrimoniaisDao(this as AppDatabase);
  LevantamentosDao _levantamentosDao;
  LevantamentosDao get levantamentosDao =>
      _levantamentosDao ??= LevantamentosDao(this as AppDatabase);
  EstruturaInventarioDao _estruturaInventarioDao;
  EstruturaInventarioDao get estruturaInventarioDao =>
      _estruturaInventarioDao ??= EstruturaInventarioDao(this as AppDatabase);
  UnidadesGestorasDao _unidadesGestorasDao;
  UnidadesGestorasDao get unidadesGestorasDao =>
      _unidadesGestorasDao ??= UnidadesGestorasDao(this as AppDatabase);
  DadosBemPatrimoniaisDao _dadosBemPatrimoniaisDao;
  DadosBemPatrimoniaisDao get dadosBemPatrimoniaisDao =>
      _dadosBemPatrimoniaisDao ??= DadosBemPatrimoniaisDao(this as AppDatabase);
  InventarioBemPatrimonialDao _inventarioBemPatrimonialDao;
  InventarioBemPatrimonialDao get inventarioBemPatrimonialDao =>
      _inventarioBemPatrimonialDao ??=
          InventarioBemPatrimonialDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        dominioDB,
        bensPatrimoniaisDB,
        estruturaInventarioDB,
        levantamentoDB,
        conexaoDB,
        unidadesGestorasDB,
        dadosBemPatrimoniaisDB,
        inventarioBemPatrimonialDB
      ];
}
