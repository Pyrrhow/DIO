import 'package:calc_imc_flutter/model/configuracoes_model.dart';
import 'package:calc_imc_flutter/repositories/configuracoes_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => ConfiguracoesPageState();
}

class ConfiguracoesPageState extends State<ConfiguracoesPage> {
  late ConfiguracoesRepository configuracoesRepository;
  var configuracoesModel = ConfiguracoesModel.vazio();
  var nomeController = TextEditingController(text: "");
  var alturaController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();
    nomeController.text = configuracoesModel.nomeUsuario.toString();
    if (configuracoesModel.altura > 0) {
      alturaController.text = configuracoesModel.altura.toString();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              textAlign: TextAlign.center,
              controller: nomeController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 141, 79, 151))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 141, 79, 151))),
                  hintText: "Nome",
                  label: Text("Nome"),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 141, 79, 151),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              textAlign: TextAlign.center,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
              ],
              keyboardType: TextInputType.number,
              controller: alturaController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 141, 79, 151))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 141, 79, 151))),
                  hintText: "Altura",
                  label: Text("Altura"),
                  suffix: Text("m"),
                  prefixIcon: Icon(
                    Icons.height,
                    color: Color.fromARGB(255, 141, 79, 151),
                  )),
            ),
          ),
          SwitchListTile(
            title: const Text("Tema escuro"),
            value: configuracoesModel.temaEscuro,
            onChanged: (bool value) {
              setState(() {
                configuracoesModel.temaEscuro = value;
              });
            },
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () {
                    configuracoesModel.nomeUsuario = nomeController.text;
                    if (alturaController.text != "") {
                      configuracoesModel.altura =
                          double.parse(alturaController.text);
                    }
                    configuracoesRepository.salvar(configuracoesModel);
                    Navigator.pop(context);
                    setState(() {});
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 141, 79, 151))),
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )),
            ),
          ),
        ],
      ),
    ));
  }
}
