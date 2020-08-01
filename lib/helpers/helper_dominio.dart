import 'package:app_inventario/models/dominio.dart';

Dominio helperDominio(dynamic dominio) {
  // if (dominio != null) {
  return Dominio(
    id: dominio['id'],
    nome: dominio['nome'],
    chave: dominio['chave'],
    codigo: dominio['codigo'],
    descricao: dominio['descricao'],
  );
  // }
}

List<Dominio> helperDominioLista(List listaDominios) {
  return List<Dominio>.from(
    (listaDominios).map(
      (item) => Dominio(
        id: item['id'],
        nome: item['nome'],
        chave: item['chave'],
        codigo: item['codigo'],
        descricao: item['descricao'],
      ),
    ),
  );
}
