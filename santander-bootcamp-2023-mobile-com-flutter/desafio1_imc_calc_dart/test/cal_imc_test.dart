import 'package:cal_imc/classes/testes.dart' as app;
import 'package:test/test.dart';

void main() {
  test('Calcular o IMC', () {
    expect(app.testImc(70, 1.77), equals(22.34));
    expect(app.testImc(50, 1.5), equals(22.22));
    expect(app.testImc(170, 1.64), equals(63.21));
    expect(app.testImc(63, 1.60), equals(24.61));
  });
  test('Mostra a classificação', () {
    expect(app.testClassificacao(15), equals("Magreza grave"));
    expect(app.testClassificacao(16), equals("Magreza moderada"));
    expect(app.testClassificacao(17), equals("Magreza leve"));
    expect(app.testClassificacao(18), equals("Magreza leve"));
    expect(app.testClassificacao(18.5), equals("Saúdavel"));
    expect(app.testClassificacao(20), equals("Saúdavel"));
    expect(app.testClassificacao(25), equals("Sobrepeso"));
    expect(app.testClassificacao(30), equals("Obesidade Grau I"));
    expect(app.testClassificacao(31), equals("Obesidade Grau I"));
    expect(app.testClassificacao(35), equals("Obesidade Grau II (severa)"));
    expect(app.testClassificacao(38), equals("Obesidade Grau II (severa)"));
    expect(app.testClassificacao(40), equals("Obesidade Grau III (mórbida)"));
    expect(app.testClassificacao(60), equals("Obesidade Grau III (mórbida)"));
  });
}
