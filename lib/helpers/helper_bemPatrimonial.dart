import 'package:app_inventario/models/bens.dart';

List<Bens> helperBemPatrimonial(List listaBens) {
  return List<Bens>.from(
    (listaBens).map(
      (item) => Bens(
        id: item['id'],
        codigoEstrutura: item['codigoEstrutura'],
        descricaoDominioSituacaoFisica: item['descricaoDominioSituacaoFisica'],
        descricaoDominioStatus: item['descricaoDominioStatus'],
        descricaoMaterial: item['descricaoMaterial'],
        idEstutura: item['idEstutura'],
        nomeEstrutura: item['nomeEstrutura'],
        numeroPatrimonial: item['numeroPatrimonial'],
      ),
    ),
  );
}
