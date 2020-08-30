import 'package:app_inventario/models/serialized/estruturaInventario.dart';

List<EstruturaInventario> helperEstruturaInventario(List listaUnidades) {
  return List<EstruturaInventario>.from(
    (listaUnidades).map(
      (item) => EstruturaInventario(
        id: item[0],
        nome: item[1],
        dataEspelho: item[2],
        dataAdicao: item[3],
        naoInformados: item[4],
        naoInconsistencia: item[5],
        emInconsistencia: item[6],
        tratados: item[7],
        baixados: item[8],
        statusEstrutura: item[9],
        idEstrutura: item[10],
        previstos: item[4] + item[5] + item[6] + item[7] + item[8],
      ),
    ),
  );
}
