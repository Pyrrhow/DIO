import 'package:calc_imc_flutter/model/configuracoes_model.dart';
import 'package:calc_imc_flutter/model/imc_model.dart';
import 'package:calc_imc_flutter/pages/configuracoes_page.dart';
import 'package:calc_imc_flutter/repositories/configuracoes_repository.dart';
import 'package:calc_imc_flutter/repositories/imc_repository.dart';
import 'package:calc_imc_flutter/service/calcular_imc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ConfiguracoesRepository configuracoesRepository;
  late ImcRepository imcRepository;

  var configuracoesModel = ConfiguracoesModel.vazio();

  var _historico = <ImcModel>[];

  var pesoController = TextEditingController(text: "");
  var alturaController = TextEditingController(text: "");
  var imcController = TextEditingController(text: "");

  bool firstLoad = false;
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();
    obterHistorico();

    if (configuracoesModel.nomeUsuario == "") {
      await Navigator.push(context,
              MaterialPageRoute(builder: (bc) => const ConfiguracoesPage()))
          .then((value) => carregarDados());
    }

    if (configuracoesModel.altura > 0) {
      alturaController.text = configuracoesModel.altura.toString();
    }
    setState(() {});
  }

  void obterHistorico() async {
    imcRepository = await ImcRepository.carregar();
    _historico = imcRepository.obterDados();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              title: const Text("Caculadora de IMC"),
              actions: [
                IconButton(
                  onPressed: () async {
                    await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (bc) => const ConfiguracoesPage()))
                        .then((value) => carregarDados());
                  },
                  icon: const Icon(Icons.settings),
                )
              ],
            ),
            body: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      alignment: Alignment.center,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        readOnly: true,
                        canRequestFocus: false,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 0),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.tertiary)),
                          hintText: configuracoesModel.nomeUsuario,
                          hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 96),
                      alignment: Alignment.center,
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                        ],
                        keyboardType: TextInputType.number,
                        controller: pesoController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 0),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)),
                            hintText: "Peso",
                            label: Text(
                              "Peso",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            ),
                            suffix: const Text("kg"),
                            prefixIcon: Icon(
                              Icons.scale,
                              color: Theme.of(context).colorScheme.tertiary,
                            )),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 96),
                      alignment: Alignment.center,
                      child: TextField(
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                        ],
                        keyboardType: TextInputType.number,
                        controller: alturaController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 0),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)),
                            hintText: "Altura",
                            label: Text(
                              "Altura",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                            ),
                            suffix: const Text("m"),
                            prefixIcon: Icon(
                              Icons.height,
                              color: Theme.of(context).colorScheme.tertiary,
                            )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () async {
                              if (pesoController.text != "") {
                                if (alturaController.text != "") {
                                  imcController.text = Imc.stringCalcular(
                                      pesoController.text,
                                      alturaController.text);

                                  imcRepository.salvar(ImcModel.criar(
                                      configuracoesModel.nomeUsuario,
                                      double.parse(imcController.text),
                                      "15",
                                      "09",
                                      "2023"));
                                  obterHistorico();
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext bc) {
                                        return const AlertDialog(
                                          title: Text(
                                              "Erro, altura não informada!"),
                                          content: Text(
                                              "Por favor digite o altura em metros"),
                                        );
                                      });
                                }
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext bc) {
                                      return const AlertDialog(
                                        title:
                                            Text("Erro, peso não informado!"),
                                        content: Text(
                                            "Por favor digite o peso em kilogramas"),
                                      );
                                    });
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).colorScheme.tertiary)),
                            child: Text(
                              "Calcular",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "IMC",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 124),
                      alignment: Alignment.center,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        readOnly: true,
                        controller: imcController,
                        canRequestFocus: false,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 0),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.tertiary)),
                          hintText: "0.00",
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Historico",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListView.builder(
                    itemCount: _historico.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var historico = _historico[index];
                      return Dismissible(
                          onDismissed:
                              (DismissDirection dismissDirection) async {
                            imcRepository.excluir(historico);
                            obterHistorico();
                          },
                          key: Key(
                              historico.dia + historico.mes + historico.ano),
                          child: ListTile(
                            title: Text(
                                "${historico.dia}/${historico.mes}/${historico.ano} -> ${historico.imc}"),
                          ));
                    },
                  ),
                )),
                const SizedBox(height: 15),
              ],
            )));
  }
}
