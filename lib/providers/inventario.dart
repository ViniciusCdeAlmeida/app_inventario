import 'package:flutter/material.dart';

class Inventario with ChangeNotifier {
  final List tipoInventario = [
    {
      'nome': 'Inventario geral',
      'tipo': 1,
    },
    {
      'nome': 'Levantamento',
      'tipo': 2,
    },
  ];
}
