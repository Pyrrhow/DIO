import 'package:back4cep/model/cep_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CepRepository {
  Future<CepModel> obterCep() async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] =
        "u0LaQgzlld61eC8T2wtM7hrO6IHizbiO0rKzGzA9";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "H2jFADAtPuAxBVfilE5DvalWSsSXJJPJ2Gn9yARs";
    dio.options.headers["Content-Type"] = "application/json";
    var result = await dio.get("https://parseapi.back4app.com/classes/Cep");
    return CepModel.fromJson(result.data);
  }

  Future<CepModel> procurarCep(String procurar) async {
    debugPrint("entrou");
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] =
        "u0LaQgzlld61eC8T2wtM7hrO6IHizbiO0rKzGzA9";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "H2jFADAtPuAxBVfilE5DvalWSsSXJJPJ2Gn9yARs";
    dio.options.headers["Content-Type"] = "application/json";

    var result = await dio.get(
        "https://parseapi.back4app.com/classes/Cep?where={\"cep\":\"$procurar\"}");
    return CepModel.fromJson(result.data);
  }
}
