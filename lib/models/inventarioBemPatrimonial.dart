import 'package:app_inventario/models/caracteristicas.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:flutter/material.dart';

class InventarioBemPatrimonial with ChangeNotifier {
  final int id;
  final int idDadosBemPatrimonialMobile;
  final int idInventarioEstruturaOrganizacionalMobile;
  final String numeroPatrimonial;
  final String numeroPatrimonialAntigo;
  final String numeroPatrimonialNovo;
  final List<Caracteristicas> caracteristicas;
  final Dominio dominioSituacaoFisica;
  final Dominio dominioStatus;
  final bool bemNaoEncontrado;
  final bool bemNaoInventariado;
  final Dominio dominioStatusInventarioBem;
  final Material material;
  final String nomeUsuarioColeta;
  final bool novoBemInvetariado;
  final String tipoMobile;

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
