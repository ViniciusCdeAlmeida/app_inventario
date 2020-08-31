import 'dart:convert';

import 'package:app_inventario/helpers/helper_bemPatrimonial.dart';
import 'package:app_inventario/models/serialized/bemPatrimonial.dart';
import 'package:app_inventario/models/serialized/dadosBensPatrimoniais.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'package:app_inventario/models/database/databaseMoor.dart';

import 'package:app_inventario/models/serialized/caracteristicas.dart';
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

  Future<DadosBemPatrimoniaisDBData> getDadosBemPatrimonial(
          int idBemPatrimonial) =>
      (select(db.dadosBemPatrimoniaisDB)
            ..where((tbl) => tbl.idBemPatrimonial.equals(idBemPatrimonial)))
          .getSingle();

  Future<DadosBemPatrimoniaisDBData> getDadosInventariar(
      int idBemPatrimonial) async {
    DadosBemPatrimoniaisDBData teste =
        await getDadosBemPatrimonial(idBemPatrimonial);
    BensPatrimoniaisDBData bemPatrimonial =
        await db.bemPatrimoniaisDao.getBemPatrimonial(idBemPatrimonial);
    teste.bemPatrimonial = helperBemPatrimonial(bemPatrimonial);
    return teste;
  }

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
            );
          }).toList(),
        );
      },
    );
  }
}
