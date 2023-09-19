import 'package:calculadora_imc/model/historico_imc.dart';
import 'package:calculadora_imc/repositories/historico_repository.dart';
import 'package:calculadora_imc/service/calcular_imc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pesoController = TextEditingController(text: "");
  var alturaController = TextEditingController(text: "");
  var imcController = TextEditingController(text: "");
  var historicoRepository = HistoricoRepository();
  var _historico = const <Historico>[];

  @override
  void initState() {
    super.initState();
    obterHistorico();
  }

  void obterHistorico() async {
    _historico = await historicoRepository.listarHistorico();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Caculadora de IMC"),
        ),
        drawer: const Drawer(),
        body: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 50),
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
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 141, 79, 151))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 141, 79, 151))),
                        hintText: "Peso",
                        label: Text("Peso"),
                        hintStyle: TextStyle(color: Colors.black),
                        suffix: Text("kg"),
                        prefixIcon: Icon(
                          Icons.scale,
                          color: Color.fromARGB(255, 141, 79, 151),
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
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 141, 79, 151))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 141, 79, 151))),
                        hintText: "Altura",
                        label: Text("Altura"),
                        hintStyle: TextStyle(color: Colors.black),
                        suffix: Text("m"),
                        prefixIcon: Icon(
                          Icons.height,
                          color: Color.fromARGB(255, 141, 79, 151),
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
                                  pesoController.text, alturaController.text);
                              await historicoRepository.adicionar(Historico(
                                  pesoController.text,
                                  alturaController.text,
                                  imcController.text));
                              setState(() {});
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext bc) {
                                    return const AlertDialog(
                                      title:
                                          Text("Erro, altura não informada!"),
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
                                    title: Text("Erro, peso não informado!"),
                                    content: Text(
                                        "Por favor digite o peso em kilogramas"),
                                  );
                                });
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 141, 79, 151))),
                        child: const Text(
                          "Calcular",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "IMC",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 141, 79, 151))),
                      hintText: "0.00",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Historico",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                  itemCount: _historico.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var historico = _historico[index];
                    return ListTile(
                      title: Text(
                          "Peso: ${historico.getPeso()} - Altura: ${historico.getAltura()} - IMC: ${historico.getImc()}"),
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
