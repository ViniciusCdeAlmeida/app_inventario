import 'package:app_inventario/models/dominio.dart';
import 'package:flutter/material.dart';

class Levantamento with ChangeNotifier {
  final int id;
  final Dominio dominioTipoInventario;
  final Dominio dominioStatusInventario;
  final String codigoENome;
  final String nome;
  final String codigo;
  final int quantidadeEstruturas;
  final int quantidadeTotalBens;
  final int quantidadeTotalBensTratados;
  final int quantidadeTotalBensEmInconsistencia;
  final int quantidadeTotalBensSemInconsistencia;
  final int quantidadeTotalBensBaixados;
  final int idOrganizacao;

  Levantamento({
    this.id,
    this.dominioTipoInventario,
    this.dominioStatusInventario,
    this.codigoENome,
    this.codigo,
    this.nome,
    this.quantidadeEstruturas,
    this.quantidadeTotalBens,
    this.quantidadeTotalBensTratados,
    this.quantidadeTotalBensSemInconsistencia,
    this.quantidadeTotalBensEmInconsistencia,
    this.quantidadeTotalBensBaixados,
    this.idOrganizacao,
  });
}
