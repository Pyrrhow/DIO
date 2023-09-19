import 'package:flutter/material.dart';

class CepPage extends StatefulWidget {
  const CepPage({super.key});

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  @override
  Widget build(BuildContext context) {
    var cepControler = TextEditingController(text: "");
    var logradouroControler = TextEditingController(text: "");
    var complementoControler = TextEditingController(text: "");
    var bairroControler = TextEditingController(text: "");
    var localidadeControler = TextEditingController(text: "");
    var ufControler = TextEditingController(text: "");
    var ibgeControler = TextEditingController(text: "");
    var giaControler = TextEditingController(text: "");
    var dddControler = TextEditingController(text: "");
    var siafiControler = TextEditingController(text: "");

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar CEP"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 64),
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
            margin: const EdgeInsets.symmetric(horizontal: 64),
            child: TextField(
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              // ],
              keyboardType: TextInputType.number,
              controller: logradouroControler,
              decoration: const InputDecoration(hintText: "Logradouro"),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 64),
            child: TextField(
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              // ],
              keyboardType: TextInputType.number,
              controller: complementoControler,
              decoration: const InputDecoration(hintText: "Complemento"),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 64),
            child: TextField(
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              // ],
              keyboardType: TextInputType.number,
              controller: bairroControler,
              decoration: const InputDecoration(hintText: "Bairro"),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 64),
            child: TextField(
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              // ],
              keyboardType: TextInputType.number,
              controller: localidadeControler,
              decoration: const InputDecoration(hintText: "Localidade"),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 64),
            child: TextField(
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              // ],
              keyboardType: TextInputType.number,
              controller: ufControler,
              decoration: const InputDecoration(hintText: "UF"),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 64),
            child: TextField(
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              // ],
              keyboardType: TextInputType.number,
              controller: ibgeControler,
              decoration: const InputDecoration(hintText: "IBGE"),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 64),
            child: TextField(
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              // ],
              keyboardType: TextInputType.number,
              controller: giaControler,
              decoration: const InputDecoration(hintText: "GIA"),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 64),
            child: TextField(
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              // ],
              keyboardType: TextInputType.number,
              controller: dddControler,
              decoration: const InputDecoration(hintText: "DDD"),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 64),
            child: TextField(
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              // ],
              keyboardType: TextInputType.number,
              controller: siafiControler,
              decoration: const InputDecoration(hintText: "SIAFI"),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 96),
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.tertiary)),
              child: Text(
                "SALVAR",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
