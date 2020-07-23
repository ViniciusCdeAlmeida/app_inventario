import 'package:app_inventario/models/dominio.dart';
import 'package:flutter/material.dart';

class Levantamento with ChangeNotifier {
  final int id;
  final Dominio dominioTipoInventario;
  final Dominio dominioStatusInventario;
  final String dataInicio;
  final String nome;
  final String codigo;
  final int quantidadeEstruturas;
  final int quantidadeTotalBens;
  final int idOrganizacao;

  Levantamento({
    this.id,
    this.dominioTipoInventario,
    this.dominioStatusInventario,
    this.dataInicio,
    this.codigo,
    this.nome,
    this.quantidadeEstruturas,
    this.quantidadeTotalBens,
    this.idOrganizacao,
  });
}
