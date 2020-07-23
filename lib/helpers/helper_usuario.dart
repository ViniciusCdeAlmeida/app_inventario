import 'package:app_inventario/models/organizacao.dart';
import '../models/login.dart';

Login helperLogin(Map login) {
  return Login(
    id: login['id'].toString(),
    organizacao: (login['organizacoes'] as List<dynamic>)
        .map(
          (item) => Organizacao(
            codigo: item['organizacao']['codigo'],
            codigoENome: item['organizacao']['codigoENome'],
            id: item['organizacao']['id'],
            sigla: item['organizacao']['sigla'],
            nome: item['organizacao']['nome'],
          ),
        )
        .toList(),
    userName: login['username'],
  );
}
