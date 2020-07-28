import 'package:app_inventario/models/dominio.dart';

Dominio helperDominio(Map dominio) {
  if (dominio != null) {
    return Dominio(
      id: dominio['id'],
      nome: dominio['nome'],
      chave: dominio['chave'],
      codigo: dominio['codigo'],
      descricao: dominio['descricao'],
    );
  }
}
