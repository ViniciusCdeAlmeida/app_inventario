import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/models/caracteristica.dart';

Caracteristica helperCaracteristica(Map listaCaracteristica) {
  return Caracteristica(
    id: listaCaracteristica['id'],
    codigo: listaCaracteristica['codigo'],
    descricao: listaCaracteristica['descricao'],
    dominioTipoDado: listaCaracteristica['dominioTipoDado'] != null
        ? helperDominio(listaCaracteristica['dominioTipoDado'])
        : null,
  );
}
