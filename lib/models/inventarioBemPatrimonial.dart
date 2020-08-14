import 'package:app_inventario/models/caracteristicas.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:flutter/material.dart';

class InventarioBemPatrimonial with ChangeNotifier {
  int id;
  int idDadosBemPatrimonialMobile;
  int idInventarioEstruturaOrganizacionalMobile;
  String numeroPatrimonial;
  String numeroPatrimonialAntigo;
  String numeroPatrimonialNovo;
  List<Caracteristicas> caracteristicas;
  Dominio dominioSituacaoFisica;
  Dominio dominioStatus;
  bool bemNaoEncontrado;
  bool bemNaoInventariado;
  Dominio dominioStatusInventarioBem;
  Material material;
  String nomeUsuarioColeta;
  bool novoBemInvetariado;
  String tipoMobile;

  InventarioBemPatrimonial({
    this.id,
    this.numeroPatrimonial,
    this.numeroPatrimonialAntigo,
    this.numeroPatrimonialNovo,
    this.dominioSituacaoFisica,
    this.dominioStatus,
    this.caracteristicas,
    this.bemNaoEncontrado,
    this.bemNaoInventariado,
    this.dominioStatusInventarioBem,
    this.idDadosBemPatrimonialMobile,
    this.idInventarioEstruturaOrganizacionalMobile,
    this.material,
    this.nomeUsuarioColeta,
    this.novoBemInvetariado,
    this.tipoMobile,
  });
}
