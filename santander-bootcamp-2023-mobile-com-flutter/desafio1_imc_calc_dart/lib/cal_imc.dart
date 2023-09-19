import 'package:cal_imc/classes/console_utils.dart';
import 'package:cal_imc/classes/pessoa.dart';

void execute() {
  var pessoa = Pessoa();
  // ignore: prefer_typing_uninitialized_variables
  var nome, peso, altura;
  print("Bem vindo a Calculadora de IMC");
  nome = ConsoleUtils.lerStringComTexto("Digite seu nome: ");
  do {
    peso = ConsoleUtils.lerDobleComTexto("Digite seu peso(kg): ");
    if (peso < 0) {
      print("peso não pode ser negativo, tente novamente!");
    }
  } while (peso == null || peso > 800 || peso <= 0);

  do {
    altura = ConsoleUtils.lerDobleComTexto("Digite seu altura(m): ");
    if (altura < 0) {
      print("altura não pode ser negativa, tente novamente!");
    } else if (altura > 3) {
      print("altura não pode ser maior que 3 metros, tente novamente!");
    }
  } while (altura == null || altura > 3 || altura <= 0);

  pessoa.setNome(nome);
  pessoa.setPeso(peso);
  pessoa.setAltura(altura);

  pessoa.calcularImc();
}
