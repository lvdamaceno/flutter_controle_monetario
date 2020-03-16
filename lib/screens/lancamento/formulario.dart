import 'package:flutter/material.dart';
import 'package:to_liso/components/editor.dart';
import 'package:to_liso/models/lancamento.dart';

class FormLancamento extends StatefulWidget {
  @override
  _FormLancamentoState createState() => _FormLancamentoState();
}

class _FormLancamentoState extends State<FormLancamento> {
  final TextEditingController _contraladorCampoValor = TextEditingController();

  final TextEditingController _controladorCampoCategoria =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Lançamento"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.00),
          child: Column(children: <Widget>[
            Editor(
              rotulo: 'Categoria',
              dica: 'Exemplo: Almoço',
              icone: Icons.create,
              tipoTeclado: TextInputType.text,
              controlador: _controladorCampoCategoria,
            ),
            Editor(
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on,
              tipoTeclado: TextInputType.text,
              controlador: _contraladorCampoValor,
            ),
            RaisedButton(
              onPressed: () {
                CriarLancamento(context);
              },
              child: Text(
                'Inserir novo lançamento.',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ])),
    );
  }

  void CriarLancamento(BuildContext context) {
    final double valor = double.tryParse(_contraladorCampoValor.text);
    final String categoria = _controladorCampoCategoria.text;
    final Lancamento lancamento = new Lancamento(valor, categoria);
    if (valor != null && categoria.isNotEmpty) {
      debugPrint("Lançamento inserido");
      debugPrint("$lancamento");
      Navigator.pop(context, lancamento);
    } else {
      debugPrint('Campo não preenchido');
    }
  }
}
