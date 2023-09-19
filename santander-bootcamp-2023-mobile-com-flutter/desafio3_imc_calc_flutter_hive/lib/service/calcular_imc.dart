class Imc {
  static double doubleCalcular(double peso, double altura) {
    return (peso / (altura * altura));
  }

  static String stringCalcular(String peso, String altura) {
    double p, a, imc;
    try {
      p = double.parse(peso);
    } catch (e) {
      return "$e";
    }
    try {
      a = double.parse(altura);
    } catch (e) {
      return "$e";
    }
    imc = (p / (a * a));

    String ret = imc.toStringAsPrecision(4);
    return ret;
  }
}
