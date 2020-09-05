import 'package:moor_flutter/moor_flutter.dart';

import 'package:app_inventario/models/serialized/inventarioBemPatrimonial.dart';
import 'package:app_inventario/models/database/databaseMoor.dart';

part 'inventarioBemPatrimonialDao.g.dart';

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
// ..where((tbl) => tbl.dominioStatusInventarioBem.length.equals(0)
  Future updateDadosInventariado(String numeroPatrimonialInventariado) {
    return (update(inventarioBemPatrimonialDB)
          ..where(
            (tbl) =>
                tbl.numeroPatrimonial.equals(numeroPatrimonialInventariado),
          ))
        .write(
      InventarioBemPatrimonialDBCompanion(
        enviado: Value(true),
      ),
    );
  }

  Future<void> insertInventarioBensPatrimoniais(
      InventarioBemPatrimonial inventarioBemPatrimonial) async {
    into(inventarioBemPatrimonialDB).insert(
      InventarioBemPatrimonialDBCompanion(
        id: Value(inventarioBemPatrimonial.id),
        bemNaoEncontrado: Value(inventarioBemPatrimonial.bemNaoEncontrado),
        bemNaoInventariado: Value(inventarioBemPatrimonial.bemNaoInventariado),
        enviado: Value(inventarioBemPatrimonial.enviado),
        idDadosBemPatrimonialMobile:
            Value(inventarioBemPatrimonial.idDadosBemPatrimonialMobile),
        idInventarioEstruturaOrganizacionalMobile: Value(
            inventarioBemPatrimonial.idInventarioEstruturaOrganizacionalMobile),
        nomeUsuarioColeta: Value(inventarioBemPatrimonial.nomeUsuarioColeta),
        novoBemInvetariado: Value(inventarioBemPatrimonial.novoBemInvetariado),
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
      ),
    );
  }

  // Future updateDadosInventarido2(
  //     InventarioBemPatrimonial inventarioBemPatrimonial) {
  //   return update(inventarioBemPatrimonialDB).replace(
  // InventarioBemPatrimonialDBCompanion(
  //   id: Value(inventarioBemPatrimonial.id),
  //   bemNaoEncontrado: Value(inventarioBemPatrimonial.bemNaoEncontrado),
  //   bemNaoInventariado: Value(inventarioBemPatrimonial.bemNaoInventariado),
  //   enviado: Value(true),
  //   idDadosBemPatrimonialMobile:
  //       Value(inventarioBemPatrimonial.idDadosBemPatrimonialMobile),
  //   idInventarioEstruturaOrganizacionalMobile: Value(
  //       inventarioBemPatrimonial.idInventarioEstruturaOrganizacionalMobile),
  //   nomeUsuarioColeta: Value(inventarioBemPatrimonial.nomeUsuarioColeta),
  //   novoBemInvetariado: Value(inventarioBemPatrimonial.novoBemInvetariado),
  //   numeroPatrimonial: Value(inventarioBemPatrimonial.numeroPatrimonial),
  //   numeroPatrimonialAntigo:
  //       Value(inventarioBemPatrimonial.numeroPatrimonialAntigo),
  //   numeroPatrimonialNovo:
  //       Value(inventarioBemPatrimonial.numeroPatrimonialNovo),
  //   tipoMobile: Value(inventarioBemPatrimonial.tipoMobile),
  //   idUnidadeOrganizacional:
  //       Value(inventarioBemPatrimonial.idUnidadeOrganizacional),
  //   caracteristicas: Value(inventarioBemPatrimonial.caracteristicas),
  //   dominioSituacaoFisica:
  //       Value(inventarioBemPatrimonial.dominioSituacaoFisica),
  //   dominioStatus: Value(inventarioBemPatrimonial.dominioStatus),
  //   dominioStatusInventarioBem:
  //       inventarioBemPatrimonial.dominioStatusInventarioBem != null
  //           ? Value(inventarioBemPatrimonial.dominioStatusInventarioBem)
  //           : Value(null),
  //   material: Value(inventarioBemPatrimonial.material),
  //     ),
  //   );
  // }

  // Future<void> insertInventarioBensPatrimoniais(
  //     List inventarioBensPatrimoniais) async {
  //   await batch(
  //     (l) {
  //       l.insertAll(
  //         db.inventarioBemPatrimonialDB,
  //         inventarioBensPatrimoniais.map((e) {
  // List<Caracteristicas> caracteristicas =
  //     (e['caracteristicas'] as List)
  //         .map((i) => Caracteristicas.fromJson(i))
  //         .toList();
  //           return InventarioBemPatrimonialDBCompanion(
  //             id: Value(e['id']),
  //             bemNaoEncontrado: Value(e['bemNaoEncontrado']),
  //             bemNaoInventariado: Value(e['bemNaoInventariado']),
  //             enviado: Value(false),
  //             idDadosBemPatrimonialMobile:
  //                 Value(e['idDadosBemPatrimonialMobile']),
  //             idInventarioEstruturaOrganizacionalMobile:
  //                 Value(e['idInventarioEstruturaOrganizacionalMobile']),
  //             nomeUsuarioColeta: Value(e['nomeUsuarioColeta']),
  //             novoBemInvetariado: Value(e['novoBemInvetariado']),
  //             numeroPatrimonial: Value(e['numeroPatrimonial']),
  //             numeroPatrimonialAntigo: Value(e['numeroPatrimonialAntigo']),
  //             numeroPatrimonialNovo: Value(e['numeroPatrimonialNovo']),
  //             tipoMobile: Value(e['tipoMobile']),
  //             idUnidadeOrganizacional: Value(e['idUnidadeOrganizacional']),
  //             caracteristicas: caracteristicas != null
  //                 ? Value(caracteristicas)
  //                 : Value(null),
  //             dominioSituacaoFisica: e['dominioSituacaoFisica'] != null
  //                 ? Value(
  //                     Dominio.fromJson(e['dominioSituacaoFisica']),
  //                   )
  //                 : Value(null),
  //             dominioStatus: e['dominioStatus'] != null
  //                 ? Value(
  //                     Dominio.fromJson(e['dominioStatus']),
  //                   )
  //                 : Value(null),
  //             dominioStatusInventarioBem:
  //                 e['dominioStatusInventarioBem'] != null
  //                     ? Value(
  //                         Dominio.fromJson(e['dominioStatusInventarioBem']),
  //                       )
  //                     : Value(null),
  //             material: e['material'] != null
  //                 ? Value(Material.fromJson(e['material']))
  //                 : Value(null),
  //           );
  //         }).toList(),
  //       );
  //     },
  //   );
  // }
}
