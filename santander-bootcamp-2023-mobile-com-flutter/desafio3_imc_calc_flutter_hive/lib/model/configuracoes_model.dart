class ConfiguracoesModel {
  String _nomeUsuario = "";
  double _altura = 0;
  bool _temaEscuro = false;

  ConfiguracoesModel.vazio();

  ConfiguracoesModel(this._nomeUsuario, this._altura, this._temaEscuro);

  String get nomeUsuario => _nomeUsuario;
  double get altura => _altura;
  bool get temaEscuro => _temaEscuro;

  set nomeUsuario(String nomeUsuario) {
    _nomeUsuario = nomeUsuario;
  }

  set altura(double altura) {
    _altura = altura;
  }

  set temaEscuro(bool temaEscuro) {
    _temaEscuro = temaEscuro;
  }
}
