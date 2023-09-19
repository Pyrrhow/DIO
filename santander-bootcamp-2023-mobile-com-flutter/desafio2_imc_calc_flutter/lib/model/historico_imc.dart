import 'package:flutter/cupertino.dart';

class Historico {
  final String _id = UniqueKey().toString();
  String _peso = "";
  String _altura = "";
  String _imc = "";

  Historico(this._peso, this._altura, this._imc);

  String getId() {
    return _id;
  }

  String getPeso() {
    return _peso;
  }

  String getAltura() {
    return _altura;
  }

  String getImc() {
    return _imc;
  }

  void setPeso(peso) {
    _peso = peso;
  }

  void setAltura(altura) {
    _altura = altura;
  }

  void setImc(imc) {
    _imc = imc;
  }
}
