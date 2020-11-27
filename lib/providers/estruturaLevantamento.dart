import 'package:dio/dio.dart';

import 'package:GRPInventario/main.dart';

import 'package:GRPInventario/helpers/index.dart';
import 'package:GRPInventario/custom/index.dart';
import 'package:GRPInventario/models/serialized/index.dart';

class EstruturaLevantamento {
  List<EstruturaInventario> _estruturas = [];
  List<EstruturaInventario> _levantamentosEstrutura = [];
  List<DadosBensPatrimoniais> _bensEstrutura = [];
  int _idUlAtual;
  BemPatrimonial _bemPatrimonial;
  String _quantidadeDigitos;
  String _digitoVerificador;

  String _nomeEstrutura;

  List<EstruturaInventario> get getLevantamentos {
    return _estruturas;
  }

  int get getUlAtual {
    return _idUlAtual;
  }

  List<EstruturaInventario> get getLevantamentosEstrutura {
    return [..._levantamentosEstrutura];
  }

  BemPatrimonial get getBemPatrimonial {
    return _bemPatrimonial;
  }

  String get getNomeEstrutura {
    return _nomeEstrutura;
  }

  String get getDigitosLeitura {
    return _quantidadeDigitos;
  }

  String get getDigitoVerificador {
    return _digitoVerificador;
  }

  void ulAtual(int id) {
    this._idUlAtual = id;
  }

  void setDigitosLeitura(String digitos) {
    _quantidadeDigitos = digitos;
  }

  void setDigitoVerificador(String digito) {
    _digitoVerificador = digito;
  }

  Future<List<EstruturaInventario>> buscaPorEstrutura(int id) async =>
      helperEstruturaInventarioLista(
          await db.estruturaInventarioDao.getAllEstruturasPorLevantamento(id));

  Future<BemPatrimonial> buscaBensPorId(String numeroBemPatrimonial,
      String idInventario, int idUnidade, String idBem) async {
    _bemPatrimonial = helperDadoBemPatrimonial2(
        await db.bemPatrimoniaisDao.getBemPatrimonial(numeroBemPatrimonial));
    _bemPatrimonial.dadosBensPatrimoniais = helperDadoBemPatrimonial(
        await db.dadosBemPatrimoniaisDao.getDadosInventariar(
            numeroBemPatrimonial.toUpperCase(), idInventario, idUnidade));
    return _bemPatrimonial;
  }

  Future<void> _getLevantamento(int idLevantamento) async {
    try {
      final filter = {
        "start": 1,
        "dir": "asc",
        "sort": "id",
        "limit": 1000000,
        "filters": [
          {
            "type": "numeric",
            "field": "inventario.id",
            "value": idLevantamento,
          },
        ],
      };
      Response response =
          await Endpoint.getInventarioEstruturaOrganizacional(filter)
              .timeout(
        Duration(minutes: 5),
      )
              .catchError((error) {
        throw error.error.message == "Connection failed"
            ? "Falha de conexão."
            : error.error.message;
      });

      _nomeEstrutura = (response.data["objects"] as List<dynamic>)
          .first["inventario"]["codigoENome"];

      await db.estruturaInventarioDao
          .insertEstruturaInventario((response.data["objects"] as List));
    } catch (error) {
      throw error;
    }
  }

  void atualizaDados(BemPatrimonial item) {
    final idx = _bensEstrutura.indexWhere((value) => value.id == item.id);
    if (idx >= 0) {
      _bensEstrutura[idx].inventariado = true;
    }
  }

  Future<void> buscaEstruturas(List<Inventario> listLevantamento) async {
    _estruturas.clear();

    db.deleteTable(db.estruturaInventarioDB);
    db.deleteTable(db.dadosBemPatrimoniaisDB);
    await Stream.fromIterable(listLevantamento)
        .asyncMap((element) => _getLevantamento(element.id))
        .toList()
        .whenComplete(
      () {
        _nomeEstrutura = null;
      },
    );
  }
}
