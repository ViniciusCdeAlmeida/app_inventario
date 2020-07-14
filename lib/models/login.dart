import 'package:flutter/material.dart';
import 'organizacao.dart';

class Login with ChangeNotifier {
  final String id;
  final String userName;
  final List<Organizacao> organizacao;

  Login({
    this.id,
    this.userName,
    this.organizacao,
  });
}
