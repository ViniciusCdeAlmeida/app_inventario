import 'dart:io';
import 'package:GRPInventario/helpers/index.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:GRPInventario/main.dart';

String conexaoAtiva;

Future<void> buscaConexaoAtiva() async {
  try {
    conexaoAtiva = helperConexao(await db.conexaoDao.getConexaoAtiva()).url;
  } on NoSuchMethodError {
    throw "Sem conexão ativa ou existe mais de uma conexão ativa.";
  }
}

Dio getConexaoPrefs() {
  Dio dio = new Dio()
    ..options.baseUrl =
        conexaoAtiva + "/citgrp-patrimonio-web/rest/inventarioMobile/";
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  };
  return dio;
}

class Endpoint {
  static Future getDadosBemPatrimonial(Map filter) async => getConexaoPrefs()
      .post('obterBensPatrimoniaisDemandaV2.json', data: filter);

  static Future getDominios() async {
    return getConexaoPrefs().get('obterDominiosInventario.json');
  }

  static Future getInventarioEstruturaOrganizacional(Map filter) async {
    return getConexaoPrefs().post(
        'obterInventarioEstruturaOrganizacionalPorDemandaV2.json',
        data: filter);
  }

  static Future getObterLevantamentosUg(int id) async {
    return getConexaoPrefs()
        .get('obterLevantamentosPorUGV3.json?idOrganizacao=$id');
  }

  static Future getObterInventariosUg(int id) async {
    return getConexaoPrefs()
        .get('obterInventariosPorUGV2.json?idOrganizacao=$id');
  }

  static Future getObterLevantamentosCodigo(String codigo) async {
    return getConexaoPrefs()
        .get('obterLevantamentoPorCodigoV2.json?codigo=$codigo');
  }

  static Future getObterInventariosCodigo(String codigo) async {
    return getConexaoPrefs()
        .get('obterInventarioPorCodigoEUGV2.json?codigo=$codigo');
  }

  static Future getSaveInventario(List itens) async {
    return getConexaoPrefs()
        .post('saveInventarioBemPatrimonialMobile.json', data: itens);
  }

  static Future getAtualizaDadosLevantamentos(int id) async {
    return getConexaoPrefs()
        .get("atualizaDadosLevantamentos.json?idLevantamento=$id");
  }

  static Future getAutenticacao({String usuario, String senha}) async =>
      getConexaoPrefs()
          // .get('usuarioValidoV2/?username=vinicius.correa&password=interno');
          .get("usuarioValidoV2/?username=$usuario&password=$senha");
  // .get("usuarioValido.json?username=citsmart&password=interno")

}
