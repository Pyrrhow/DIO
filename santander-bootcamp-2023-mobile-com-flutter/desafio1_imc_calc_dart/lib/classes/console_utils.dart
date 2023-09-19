import 'dart:convert';
import 'dart:io';

class ConsoleUtils {
  static String lerString() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static String lerStringComTexto(String texto) {
    print(texto);
    return lerString();
  }

  static double? lerDouble() {
    var value = lerString();
    try {
      return double.parse(value);
    } catch (e) {
      print(e);
      print("valor invalido, porfavor tente novamente!");
      return null;
    }
  }

  static double? lerDobleComTexto(String texto) {
    print(texto);
    return lerDouble();
  }
}
