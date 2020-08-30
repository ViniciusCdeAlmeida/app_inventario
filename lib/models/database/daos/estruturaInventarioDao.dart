import 'dart:convert';

import 'package:app_inventario/models/database/databaseMoor.dart';
import 'package:app_inventario/models/serialized/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:app_inventario/models/serialized/organizacao.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'estruturaInventarioDao.g.dart';

@UseDao(tables: [LevantamentoDB])
class EstruturaInventarioDao extends DatabaseAccessor<AppDatabase>
    with _$EstruturaInventarioDaoMixin {
  final AppDatabase db;

  EstruturaInventarioDao(this.db) : super(db);

  Future<List<dynamic>> getAllEstruturas() {
    return customSelect(
        'SELECT COUNT(id) AS "amount" FROM ' +
            db.estruturaInventarioDB.actualTableName +
            ';',
        readsFrom: {db.estruturaInventarioDB}).get();
  }

  Future<List<Organizacao>> getAllEstruturasPorLevantamento(int idInventario) =>
      (customSelect(
              'SELECT estrutura_organizacional FROM ' +
                  db.estruturaInventarioDB.actualTableName +
                  ' where id_inventario = $idInventario ;',
              readsFrom: {db.estruturaInventarioDB}).get().then(
            (value) => value
                .map((e) => Organizacao.fromJson(
                    json.decode(e.data['estrutura_organizacional'])))
                .toList(),
          ));

  dynamic getAllDadosPorEstrutura(int idInventario) => (customSelect(
          'SELECT dados_bens_patrimoniais FROM ' +
              db.estruturaInventarioDB.actualTableName +
              ' where estrutura_organizacional.id = $idInventario ;',
          readsFrom: {db.estruturaInventarioDB}).get().then(
        (value) => value
            .map((e) => Organizacao.fromJson(
                json.decode(e.data['estrutura_organizacional'])))
            .toList(),
      ));

  Future<EstruturaInventarioDBData> getVerificaEstruturasInventario() =>
      (select(db.estruturaInventarioDB)..limit(1)).getSingle();

  Future<void> insertEstruturaInventario(List levantamentos) async {
    await batch(
      (l) {
        l.insertAll(
          db.estruturaInventarioDB,
          levantamentos.map((e) {
            db.dadosBemPatrimoniaisDao.insertDadosBensPatrimoniais(
                e['dadosBensPatrimoniais'] as List);
            return EstruturaInventarioDBCompanion(
              id: Value(e['id']),
              estruturaOrganizacional: Value(
                Organizacao.fromJson(e['estruturaOrganizacional']),
              ),
              dominioStatusInventarioEstrutura:
                  e['dominioStatusInventarioEstrutura'] != null
                      ? Value(
                          Dominio.fromJson(
                              e['dominioStatusInventarioEstrutura']),
                        )
                      : Value(null),
              idInventario: Value(
                e['idInventario'],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
