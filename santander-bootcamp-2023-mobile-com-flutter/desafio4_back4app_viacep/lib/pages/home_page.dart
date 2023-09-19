import 'package:back4cep/model/cep_model.dart';
import 'package:back4cep/pages/cep_page.dart';
import 'package:back4cep/repository/cep_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cep = CepModel([]);
  var cepControler = TextEditingController(text: "");
  bool carregando = false;

  @override
  void initState() {
    super.initState();
    carregarCeps();
  }

  void carregarCeps() async {
    setState(() {
      carregando = true;
    });
    cep = await CepRepository().obterCep();
    setState(() {
      carregando = false;
    });
  }

  void procurarCep(String procurar) async {
    setState(() {
      carregando = true;
    });
    cep = await CepRepository().procurarCep(procurar);
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Back4Cep"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              // ],
              keyboardType: TextInputType.number,
              controller: cepControler,
              decoration: const InputDecoration(hintText: "CEP"),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 96),
            child: TextButton(
              onPressed: () async {
                procurarCep(cepControler.text);
                if (cep.results.isEmpty) {
                  await showDialog(
                      context: context,
                      builder: (BuildContext bc) {
                        return AlertDialog(
                          title: const Text("Cep não encontrado"),
                          content: Text(
                              "Gostaria de adicionar o CEP ${cepControler.text} no banco de dados?"),
                          actions: [
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue)),
                                onPressed: () {
                                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (bc) => const CepPage()))
                                      .then((value) => carregarCeps());
                                },
                                child: const Text(
                                  "ADICIONAR",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        );
                      });
                }
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.tertiary)),
              child: Text(
                "PROCURAR",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 96),
            child: TextButton(
              onPressed: () {
                carregarCeps();
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.tertiary)),
              child: Text(
                "TODOS",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Lista de Ceps cadastrados",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: carregando
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: cep.results.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var cepList = cep.results[index];
                      return Dismissible(
                          onDismissed:
                              (DismissDirection dismissDirection) async {
                            carregarCeps();
                          },
                          key: Key(cepList.cep),
                          child: ListTile(
                            title: Text("CEP: ${cepList.cep}"),
                          ));
                    },
                  ),
          )
        ],
      ),
    ));
  }
}
