import 'package:app_inventario/models/organizacao.dart';

Organizacao helperEstruturaOrganizacional(Map organizacao) {
  return Organizacao(
    id: organizacao['id'],
    nome: organizacao['nome'],
    sigla: organizacao['sigla'],
    codigo: organizacao['codigo'],
    codigoENome: organizacao['codigoENome'],
  );
}
