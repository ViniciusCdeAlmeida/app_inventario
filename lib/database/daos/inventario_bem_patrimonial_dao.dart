import 'package:moor_flutter/moor_flutter.dart';

import 'package:GRPInventario/models/index_models.dart';
import 'package:GRPInventario/database/tables/index_tables.dart';
import 'package:GRPInventario/database/database_moor.dart';

part 'inventario_bem_patrimonial_dao.g.dart';

@UseDao(tables: [InventarioBemPatrimonialDB])
class InventarioBemPatrimonialDao extends DatabaseAccessor<AppDatabase>
    with _$InventarioBemPatrimonialDaoMixin {
  final AppDatabase db;

  InventarioBemPatrimonialDao(this.db) : super(db);

  Future<List<InventarioBemPatrimonialDBData>> getInventariados(
          int idUnidade) =>
      (select(db.inventarioBemPatrimonialDB)
            ..where((tbl) => tbl.idUnidadeOrganizacional.equals(idUnidade)))
          .get();

  Future<List<InventarioBemPatrimonialDBData>> getInventariadosTipo(
          bool tipo) =>
      (select(db.inventarioBemPatrimonialDB)
            ..where(
              (tbl) => tbl.enviado.equals(tipo),
            ))
          .get();

  Future<List<InventarioBemPatrimonialDBData>> getInventariadosForaEspelho(
          String idInventarioEstrutura) =>
      (select(db.inventarioBemPatrimonialDB)
            ..where(
              (tbl) =>
                  tbl.idInventarioEstruturaOrganizacionalMobile
                      .equals(int.parse(idInventarioEstrutura)) &
                  isNull(tbl.dominioStatusInventarioBem),
            ))
          .get();

  Future updateDadosInventariado(String numeroPatrimonialInventariado) =>
      (update(inventarioBemPatrimonialDB)
            ..where(
              (tbl) =>
                  tbl.numeroPatrimonial.equals(numeroPatrimonialInventariado),
            ))
          .write(
        InventarioBemPatrimonialDBCompanion(
          enviado: Value(true),
        ),
      );

  Future<void> insertInventarioBensPatrimoniais(
          InventarioBemPatrimonial inventarioBemPatrimonial) async =>
      into(inventarioBemPatrimonialDB).insert(
        InventarioBemPatrimonialDBCompanion(
          id: Value(inventarioBemPatrimonial.id),
          bemNaoEncontrado: Value(inventarioBemPatrimonial.bemNaoEncontrado),
          bemNaoInventariado:
              Value(inventarioBemPatrimonial.bemNaoInventariado),
          enviado: Value(inventarioBemPatrimonial.enviado),
          idDadosBemPatrimonialMobile:
              Value(inventarioBemPatrimonial.idDadosBemPatrimonialMobile),
          idInventarioEstruturaOrganizacionalMobile: Value(
              inventarioBemPatrimonial
                  .idInventarioEstruturaOrganizacionalMobile),
          nomeUsuarioColeta: Value(inventarioBemPatrimonial.nomeUsuarioColeta),
          novoBemInvetariado:
              Value(inventarioBemPatrimonial.novoBemInvetariado),
          numeroPatrimonial: Value(inventarioBemPatrimonial.numeroPatrimonial),
          numeroPatrimonialAntigo:
              Value(inventarioBemPatrimonial.numeroPatrimonialAntigo),
          numeroPatrimonialNovo:
              Value(inventarioBemPatrimonial.numeroPatrimonialNovo),
          tipoMobile: Value(inventarioBemPatrimonial.tipoMobile),
          idUnidadeOrganizacional:
              Value(inventarioBemPatrimonial.idUnidadeOrganizacional),
          caracteristicas: Value(inventarioBemPatrimonial.caracteristicas),
          dominioSituacaoFisica:
              Value(inventarioBemPatrimonial.dominioSituacaoFisica),
          dominioStatus: Value(inventarioBemPatrimonial.dominioStatus),
          dominioStatusInventarioBem:
              inventarioBemPatrimonial.dominioStatusInventarioBem != null
                  ? Value(inventarioBemPatrimonial.dominioStatusInventarioBem)
                  : Value(null),
          material: Value(inventarioBemPatrimonial.material),
          idDominioSituacaoFisica:
              Value(inventarioBemPatrimonial.idDominioSituacaoFisica),
          idDominioStatus: Value(inventarioBemPatrimonial.idDominioStatus),
          idEstruturaOrganizacionalAtual:
              Value(inventarioBemPatrimonial.idEstruturaOrganizacionalAtual),
          idMaterial: Value(inventarioBemPatrimonial.idMaterial),
        ),
      );
}
