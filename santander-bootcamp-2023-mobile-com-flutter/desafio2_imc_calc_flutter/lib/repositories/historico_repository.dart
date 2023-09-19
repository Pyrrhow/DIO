import 'package:calculadora_imc/model/historico_imc.dart';

class HistoricoRepository {
  final List<Historico> _historico = [];

  Future<void> adicionar(Historico historico) async {
    await Future.delayed(const Duration(seconds: 1));
    _historico.add(historico);
  }

  // void alterar(String id, bool concluido) async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   _historico.where((historico) => historico.getId() == id).first.setConcluido(concluido);
  // }

  Future<List<Historico>> listarHistorico() async {
    await Future.delayed(const Duration(seconds: 1));
    return _historico;
  }
}
