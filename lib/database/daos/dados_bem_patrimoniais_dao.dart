import 'package:moor_flutter/moor_flutter.dart';
import 'package:GRPInventario/database/database_moor.dart';
import 'package:GRPInventario/models/index_models.dart';
import 'package:GRPInventario/database/tables/index_tables.dart';

part 'dados_bem_patrimoniais_dao.g.dart';

@UseDao(tables: [DadosBemPatrimoniaisDB])

/// Classe responsável por gerar as operações de banco de dados da tabela [DadosBemPatrimoniaisDB].
class DadosBemPatrimoniaisDao extends DatabaseAccessor<AppDatabase>
    with _$DadosBemPatrimoniaisDaoMixin {
  final AppDatabase db;

  DadosBemPatrimoniaisDao(this.db) : super(db);

  /// Método responsável por buscar todos os dados bem patrimoniais dado uma estrutura.
  Future<List<DadosBemPatrimoniaisDBData>> getAllDadosPorEstrutura(
          int idEstrutura) =>
      (select(db.dadosBemPatrimoniaisDB)
            ..where((tbl) => tbl.idEstruturaOrganizacional.equals(idEstrutura)))
          .get();

  /// Método responsável por buscar o dado bem patrimonial de um bem patrimonial.
  Future<DadosBemPatrimoniaisDBData> getDadosInventariar(
          String numeroBemPatrimonial, String idInventario, int idUnidade) =>
      (select(db.dadosBemPatrimoniaisDB)
            ..where((tbl) =>
                tbl.numeroPatrimonialCompleto.equals(numeroBemPatrimonial) &
                tbl.idInventario.equals(int.parse(idInventario)) &
                tbl.idEstruturaOrganizacional.equals(idUnidade)))
          .getSingle();

  /// Método responsável por atualizar um dado bem patrimonial marcando-o como inventariado.
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

  /// Método responsável por inserir uma lista de dados bens patrimoniais no banco de dados.
  Future<void> insertDadosBensPatrimoniais(List dadosBemPatrimonial) async =>
      await batch(
        (l) {
          l.insertAll(
            db.dadosBemPatrimoniaisDB,
            dadosBemPatrimonial.map((e) {
              return DadosBemPatrimoniaisDBCompanion(
                id: Value(e['id']),
                idBemPatrimonial: Value(e['idBemPatrimonial']),
                numeroPatrimonialCompleto:
                    Value(e['numeroPatrimonialCompleto']),
                idEstruturaOrganizacional:
                    Value(e['idEstruturaOrganizacional']),
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
                estruturaOrganizacionalAtual:
                    e['estruturaOrganizacionalAtual'] != null
                        ? Value(Organizacao.fromJson(
                            e['estruturaOrganizacionalAtual']))
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
