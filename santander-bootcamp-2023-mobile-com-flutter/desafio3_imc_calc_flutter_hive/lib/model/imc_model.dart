import 'package:hive/hive.dart';
part 'imc_model.g.dart';

@HiveType(typeId: 0)
class ImcModel extends HiveObject {
  @HiveField(0)
  String nome = "";

  @HiveField(1)
  double imc = 0;

  @HiveField(2)
  String dia = "";

  @HiveField(3)
  String mes = "";

  @HiveField(4)
  String ano = "";

  ImcModel();

  ImcModel.criar(this.nome, this.imc, this.dia, this.mes, this.ano);
}
