import 'dart:convert';
import 'dart:io';

// import 'package:app_inventario/helpers/helper_levantamento.dart';
// import 'package:app_inventario/models/levantamento.dart';
import 'package:app_inventario/models/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:app_inventario/models/bens.dart';
import 'package:http/io_client.dart';

class BensProvier with ChangeNotifier {
  // List<Levantamento> levantamentos = [];
  // final int idOrganizacao;
  // bool _isLoading = false;

  // Levantamentos({this.levantamentos, this.idOrganizacao});

  // List<Levantamento> get getLevantamentos {
  //   return levantamentos;
  // }

  // bool get isLoading => _isLoading;

  Future<BuiltList<Bens>> _getBens(String conexao) async {
    Dio dio = new Dio()
      ..options.baseUrl =
          conexao + "/citgrp-patrimonio-web/rest/inventarioMobile/";
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    // bool trustSelfSigned = true;
    // HttpClient httpClient = new HttpClient();
    // httpClient.badCertificateCallback =
    //     ((X509Certificate cert, String host, int port) => trustSelfSigned);
    // IOClient ioClient = new IOClient(httpClient);
    try {
      Response response = await dio.get("obterBensPatrimoniais.json",
          onReceiveProgress: (actbyt, totalbyt) {
        // print('$actbyt');
      });
      // final response2 = await ioClient.get(conexao +
      //     "/citgrp-patrimonio-web/rest/inventarioMobile/obterBensPatrimoniais.json");
      // final responseData = json.decode(utf8.decode(response2.bodyBytes));
      // print(response2.contentLength);
      // final teste = response.data["payload"];
      final BuiltList<Bens> listBens = deserializeListOf<Bens>(response.data);

      // Bens benslist = serializers.deserializeWith(Bens.serializer, listBens.toBuilder());
      // Bens bens = serializers.deserializeWith(
      //     Bens.serializer, json.decode(utf8.decode(response2.bodyBytes)));
      // final teste = response.data["payload"];
      // print(bens);
      return listBens;
    } catch (error) {
      throw error;
    }
  }

  // void markAsLoading() {
  //   _isLoading = true;
  //   notifyListeners();
  // }

  Future<void> buscaBens(String conexao) async {
    // markAsLoading();
    await _getBens(conexao);

    // _isLoading = false;
    // notifyListeners();
  }
}
