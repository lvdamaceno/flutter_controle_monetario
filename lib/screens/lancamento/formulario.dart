import 'package:flutter/material.dart';
import 'package:to_liso/components/editor.dart';
import 'package:to_liso/models/lancamento.dart';

const _tituloAppBar = 'Novo Lançamento';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _rotuloCampocategoria = 'Categoria';
const _dicaCampoCategoria = 'Exemplo: Alimentação';
const _rotuloBotaoInserir = 'Inserir novo lançamento';

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
        title: Text(_tituloAppBar),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.00),
          child: Column(children: <Widget>[
            Editor(
              rotulo: _rotuloCampocategoria,
              dica: _dicaCampoCategoria,
              icone: Icons.create,
              tipoTeclado: TextInputType.text,
              controlador: _controladorCampoCategoria,
            ),
            Editor(
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
              tipoTeclado: TextInputType.text,
              controlador: _contraladorCampoValor,
            ),
            RaisedButton(
              onPressed: () {
                _criarLancamento(context);
              },
              child: Text(
                _rotuloBotaoInserir,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ])),
    );
  }

  void _criarLancamento(BuildContext context) {
    final double valor = double.tryParse(_contraladorCampoValor.text);
    final String categoria = _controladorCampoCategoria.text;
    final Lancamento lancamento = new Lancamento(valor, categoria);
    if (valor != null && categoria.isNotEmpty) {
      Navigator.pop(context, lancamento);
    } else {
      debugPrint('Campo não preenchido');
    }
  }
}
