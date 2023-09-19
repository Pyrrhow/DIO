class Pessoa {
  String _nome = "";
  double _peso = 0;
  double _altura = 0;
  double _imc = 0;
  String _classificacao = "";

  void setNome(String nome) {
    _nome = nome;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  String getNome() {
    return _nome;
  }

  double getPeso() {
    return _peso;
  }

  double getAltura() {
    return _altura;
  }

  void calcularImc() {
    _imc = double.parse((_peso / (_altura * _altura)).toStringAsFixed(2));
    setClassificacao(_imc);
    print(
        "$_nome tem o peso de $_peso kg, e $_altura m de altura \nseu  IMC é de $_imc -> $_classificacao");
  }

  void setClassificacao(double imc) {
    if (_imc < 16) {
      _classificacao = "Magreza grave";
    } else if (_imc < 17) {
      _classificacao = "Magreza moderada";
    } else if (_imc < 18.5) {
      _classificacao = "Magreza leve";
    } else if (_imc < 25) {
      _classificacao = "Saúdavel";
    } else if (_imc < 30) {
      _classificacao = "Sobrepeso";
    } else if (_imc < 35) {
      _classificacao = "Obesidade Grau I";
    } else if (_imc < 40) {
      _classificacao = "Obesidade Grau II (severa)";
    } else {
      _classificacao = "Obesidade Grau III (mórbida)";
    }
  }
}
