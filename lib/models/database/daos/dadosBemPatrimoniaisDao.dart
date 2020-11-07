import 'package:moor_flutter/moor_flutter.dart';

import 'package:app_inventario/models/database/databaseMoor.dart';

import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:app_inventario/models/serialized/inventarioDadosBemPatrimonial.dart';
import 'package:app_inventario/models/serialized/material.dart';
import 'package:app_inventario/models/serialized/organizacao.dart';

part 'dadosBemPatrimoniaisDao.g.dart';

@UseDao(tables: [DadosBemPatrimoniaisDB])
class DadosBemPatrimoniaisDao extends DatabaseAccessor<AppDatabase>
    with _$DadosBemPatrimoniaisDaoMixin {
  final AppDatabase db;

  DadosBemPatrimoniaisDao(this.db) : super(db);

  Future<List<DadosBemPatrimoniaisDBData>> getAllDadosPorEstrutura(
          int idEstrutura) =>
      (select(db.dadosBemPatrimoniaisDB)
            ..where((tbl) => tbl.idEstruturaOrganizacional.equals(idEstrutura)))
          .get();

  Future<DadosBemPatrimoniaisDBData> getDadosInventariar(
          String numeroBemPatrimonial, String idInventario, int idUnidade) =>
      (select(db.dadosBemPatrimoniaisDB)
            ..where((tbl) =>
                tbl.numeroPatrimonialCompleto.equals(numeroBemPatrimonial) &
                tbl.idInventario.equals(int.parse(idInventario)) &
                tbl.idEstruturaOrganizacional.equals(idUnidade)))
          .getSingle();

  Future<void> updateDadosBemPatrimonial(int idBemPatrimonial) =>
      (update(db.dadosBemPatrimoniaisDB)
            ..where(
              (tbl) => tbl.idBemPatrimonial.equals(idBemPatrimonial),
            ))
          .write(
        DadosBemPatrimoniaisDBCompanion(
          inventariado: Value(true),
        ),
      );

  Future<void> insertDadosBensPatrimoniais(List dadosBemPatrimonial) async {
    await batch(
      (l) {
        l.insertAll(
          db.dadosBemPatrimoniaisDB,
          dadosBemPatrimonial.map((e) {
            return DadosBemPatrimoniaisDBCompanion(
              id: Value(e['id']),
              idBemPatrimonial: Value(e['idBemPatrimonial']),
              numeroPatrimonialCompleto: Value(e['numeroPatrimonialCompleto']),
              idEstruturaOrganizacional: Value(e['idEstruturaOrganizacional']),
              idInventario: Value(e['idInventario']),
              dominioSituacaoFisica: e['dominioSituacaoFisica'] != null
                  ? Value(
                      Dominio.fromJson(e['dominioSituacaoFisica']),
                    )
                  : Value(null),
              dominioStatus: e['dominioStatus'] != null
                  ? Value(
                      Dominio.fromJson(e['dominioStatus']),
                    )
                  : Value(null),
              dominioStatusInventarioBem:
                  e['dominioStatusInventarioBem'] != null
                      ? Value(
                          Dominio.fromJson(e['dominioStatusInventarioBem']),
                        )
                      : Value(null),
              estruturaOrganizacionalAtual: e['estruturaOrganizacionalAtual'] !=
                      null
                  ? Value(
                      Organizacao.fromJson(e['estruturaOrganizacionalAtual']))
                  : Value(null),
              material: e['material'] != null
                  ? Value(Material.fromJson(e['material']))
                  : Value(null),
              inventarioBemPatrimonial: e['inventarioBemPatrimonial'] != null
                  ? Value(InventarioDadosBemPatrimonial.fromJson(
                      e['inventarioBemPatrimonial']))
                  : Value(null),
              inventariado: e['inventarioBemPatrimonial'] != null
                  ? Value(true)
                  : Value(false),
            );
          }).toList(),
        );
      },
    );
  }
}
