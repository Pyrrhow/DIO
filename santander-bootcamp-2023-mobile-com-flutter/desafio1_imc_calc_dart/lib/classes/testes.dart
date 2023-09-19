String testClassificacao(double imc) {
  String clas;
  if (imc < 16) {
    clas = "Magreza grave";
  } else if (imc < 17) {
    clas = "Magreza moderada";
  } else if (imc < 18.5) {
    clas = "Magreza leve";
  } else if (imc < 25) {
    clas = "Saúdavel";
  } else if (imc < 30) {
    clas = "Sobrepeso";
  } else if (imc < 35) {
    clas = "Obesidade Grau I";
  } else if (imc < 40) {
    clas = "Obesidade Grau II (severa)";
  } else {
    clas = "Obesidade Grau III (mórbida)";
  }
  return clas;
}

double testImc(double peso, double altura) {
  return double.parse((peso / (altura * altura)).toStringAsFixed(2));
}
