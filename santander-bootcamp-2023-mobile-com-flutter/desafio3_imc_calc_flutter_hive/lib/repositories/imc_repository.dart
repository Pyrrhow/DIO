import 'package:calc_imc_flutter/model/imc_model.dart';
import 'package:hive/hive.dart';

class ImcRepository {
  static late Box _box;

  ImcRepository._criar();

  static Future<ImcRepository> carregar() async {
    if (Hive.isBoxOpen('imc2')) {
      _box = Hive.box('imc2');
    } else {
      _box = await Hive.openBox('imc2');
    }
    return ImcRepository._criar();
  }

  salvar(ImcModel imcModel) {
    _box.add(imcModel);
  }

  alterar(ImcModel imcModel) {
    imcModel.save();
  }

  excluir(ImcModel imcModel) {
    imcModel.delete();
  }

  List<ImcModel> obterDados() {
    return _box.values.cast<ImcModel>().toList();
  }
}
