import 'dart:io';
import 'package:app_inventario/models/serialized/bemPatrimonial.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BensProvier with ChangeNotifier {
  List<BemPatrimonial> _bens = [];
  List<BemPatrimonial> _bensEstrutura = [];

  bool _isLoading = false;

  List<BemPatrimonial> get getBens {
    return _bens;
  }

  List<BemPatrimonial> get getBensEstrutura {
    return [..._bensEstrutura];
  }

  void buscaPorEstrutura(int id) {
    List<BemPatrimonial> lista =
        _bens.where((element) => element.id == id).toList();
    if (lista.isNotEmpty) {
      _bensEstrutura = lista;
    } else {
      _bensEstrutura.clear();
    }
  }

  bool get isLoading => _isLoading;

  void markAsLoading() {
    _isLoading = true;
    notifyListeners();
  }

  Future<void> buscaBens(String conexao) async {
    markAsLoading();
    _isLoading = false;
    notifyListeners();
  }
}
