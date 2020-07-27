// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bens_old.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BensOLD> _$bensOLDSerializer = new _$BensOLDSerializer();

class _$BensOLDSerializer implements StructuredSerializer<BensOLD> {
  @override
  final Iterable<Type> types = const [BensOLD, _$BensOLD];
  @override
  final String wireName = 'BensOLD';

  @override
  Iterable<Object> serialize(Serializers serializers, BensOLD object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];
    if (object.descricaoDominioSituacaoFisica != null) {
      result
        ..add('descricaoDominioSituacaoFisica')
        ..add(serializers.serialize(object.descricaoDominioSituacaoFisica,
            specifiedType: const FullType(String)));
    }
    if (object.codigoEstrutura != null) {
      result
        ..add('codigoEstrutura')
        ..add(serializers.serialize(object.codigoEstrutura,
            specifiedType: const FullType(String)));
    }
    if (object.idEstutura != null) {
      result
        ..add('idEstutura')
        ..add(serializers.serialize(object.idEstutura,
            specifiedType: const FullType(int)));
    }
    if (object.descricaoMaterial != null) {
      result
        ..add('descricaoMaterial')
        ..add(serializers.serialize(object.descricaoMaterial,
            specifiedType: const FullType(String)));
    }
    if (object.nomeEstrutura != null) {
      result
        ..add('nomeEstrutura')
        ..add(serializers.serialize(object.nomeEstrutura,
            specifiedType: const FullType(String)));
    }
    if (object.numeroPatrimonial != null) {
      result
        ..add('numeroPatrimonial')
        ..add(serializers.serialize(object.numeroPatrimonial,
            specifiedType: const FullType(String)));
    }
    if (object.descricaoDominioStatus != null) {
      result
        ..add('descricaoDominioStatus')
        ..add(serializers.serialize(object.descricaoDominioStatus,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BensOLD deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BensOLDBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'descricaoDominioSituacaoFisica':
          result.descricaoDominioSituacaoFisica = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'codigoEstrutura':
          result.codigoEstrutura = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'idEstutura':
          result.idEstutura = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'descricaoMaterial':
          result.descricaoMaterial = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nomeEstrutura':
          result.nomeEstrutura = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'numeroPatrimonial':
          result.numeroPatrimonial = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'descricaoDominioStatus':
          result.descricaoDominioStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BensOLD extends BensOLD {
  @override
  final int id;
  @override
  final String descricaoDominioSituacaoFisica;
  @override
  final String codigoEstrutura;
  @override
  final int idEstutura;
  @override
  final String descricaoMaterial;
  @override
  final String nomeEstrutura;
  @override
  final String numeroPatrimonial;
  @override
  final String descricaoDominioStatus;

  factory _$BensOLD([void Function(BensOLDBuilder) updates]) =>
      (new BensOLDBuilder()..update(updates)).build();

  _$BensOLD._(
      {this.id,
      this.descricaoDominioSituacaoFisica,
      this.codigoEstrutura,
      this.idEstutura,
      this.descricaoMaterial,
      this.nomeEstrutura,
      this.numeroPatrimonial,
      this.descricaoDominioStatus})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('BensOLD', 'id');
    }
  }

  @override
  BensOLD rebuild(void Function(BensOLDBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BensOLDBuilder toBuilder() => new BensOLDBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BensOLD &&
        id == other.id &&
        descricaoDominioSituacaoFisica ==
            other.descricaoDominioSituacaoFisica &&
        codigoEstrutura == other.codigoEstrutura &&
        idEstutura == other.idEstutura &&
        descricaoMaterial == other.descricaoMaterial &&
        nomeEstrutura == other.nomeEstrutura &&
        numeroPatrimonial == other.numeroPatrimonial &&
        descricaoDominioStatus == other.descricaoDominioStatus;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, id.hashCode),
                                descricaoDominioSituacaoFisica.hashCode),
                            codigoEstrutura.hashCode),
                        idEstutura.hashCode),
                    descricaoMaterial.hashCode),
                nomeEstrutura.hashCode),
            numeroPatrimonial.hashCode),
        descricaoDominioStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BensOLD')
          ..add('id', id)
          ..add(
              'descricaoDominioSituacaoFisica', descricaoDominioSituacaoFisica)
          ..add('codigoEstrutura', codigoEstrutura)
          ..add('idEstutura', idEstutura)
          ..add('descricaoMaterial', descricaoMaterial)
          ..add('nomeEstrutura', nomeEstrutura)
          ..add('numeroPatrimonial', numeroPatrimonial)
          ..add('descricaoDominioStatus', descricaoDominioStatus))
        .toString();
  }
}

class BensOLDBuilder implements Builder<BensOLD, BensOLDBuilder> {
  _$BensOLD _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _descricaoDominioSituacaoFisica;
  String get descricaoDominioSituacaoFisica =>
      _$this._descricaoDominioSituacaoFisica;
  set descricaoDominioSituacaoFisica(String descricaoDominioSituacaoFisica) =>
      _$this._descricaoDominioSituacaoFisica = descricaoDominioSituacaoFisica;

  String _codigoEstrutura;
  String get codigoEstrutura => _$this._codigoEstrutura;
  set codigoEstrutura(String codigoEstrutura) =>
      _$this._codigoEstrutura = codigoEstrutura;

  int _idEstutura;
  int get idEstutura => _$this._idEstutura;
  set idEstutura(int idEstutura) => _$this._idEstutura = idEstutura;

  String _descricaoMaterial;
  String get descricaoMaterial => _$this._descricaoMaterial;
  set descricaoMaterial(String descricaoMaterial) =>
      _$this._descricaoMaterial = descricaoMaterial;

  String _nomeEstrutura;
  String get nomeEstrutura => _$this._nomeEstrutura;
  set nomeEstrutura(String nomeEstrutura) =>
      _$this._nomeEstrutura = nomeEstrutura;

  String _numeroPatrimonial;
  String get numeroPatrimonial => _$this._numeroPatrimonial;
  set numeroPatrimonial(String numeroPatrimonial) =>
      _$this._numeroPatrimonial = numeroPatrimonial;

  String _descricaoDominioStatus;
  String get descricaoDominioStatus => _$this._descricaoDominioStatus;
  set descricaoDominioStatus(String descricaoDominioStatus) =>
      _$this._descricaoDominioStatus = descricaoDominioStatus;

  BensOLDBuilder();

  BensOLDBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _descricaoDominioSituacaoFisica = _$v.descricaoDominioSituacaoFisica;
      _codigoEstrutura = _$v.codigoEstrutura;
      _idEstutura = _$v.idEstutura;
      _descricaoMaterial = _$v.descricaoMaterial;
      _nomeEstrutura = _$v.nomeEstrutura;
      _numeroPatrimonial = _$v.numeroPatrimonial;
      _descricaoDominioStatus = _$v.descricaoDominioStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BensOLD other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BensOLD;
  }

  @override
  void update(void Function(BensOLDBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BensOLD build() {
    final _$result = _$v ??
        new _$BensOLD._(
            id: id,
            descricaoDominioSituacaoFisica: descricaoDominioSituacaoFisica,
            codigoEstrutura: codigoEstrutura,
            idEstutura: idEstutura,
            descricaoMaterial: descricaoMaterial,
            nomeEstrutura: nomeEstrutura,
            numeroPatrimonial: numeroPatrimonial,
            descricaoDominioStatus: descricaoDominioStatus);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
