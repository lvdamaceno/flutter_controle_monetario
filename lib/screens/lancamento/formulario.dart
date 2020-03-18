import 'package:flutter/material.dart';
import 'package:to_liso/components/editor.dart';
import 'package:to_liso/components/seletor.dart';
import 'package:to_liso/models/lancamento.dart';
import 'package:to_liso/screens/lancamento/validacoes.dart';

const _tituloAppBar = 'Novo Lançamento';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _rotuloCampoCategoria = 'Categoria';
const List<String> _listaCategorias = ['Aluguel', 'Alimentação', 'Transporte'];
const _dicaCampoCategoria = 'Exemplo: Alimentação';
const _rotuloBotaoInserir = 'Inserir novo lançamento';

class FormLancamento extends StatefulWidget {

  @override
  _FormLancamentoState createState() => _FormLancamentoState();
}

class _FormLancamentoState extends State<FormLancamento> {
  final TextEditingController _contraladorCampoValor = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _autovalidate = false;
  String _controladorListaCategoria = _listaCategorias[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        autovalidate: true,
        child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              Seletor(
                controlador: (String value) {
                  setState(() {
                    _controladorListaCategoria = value;
                  });
                },
                lista: _listaCategorias,
                dica: _dicaCampoCategoria,
                rotulo: _rotuloCampoCategoria,
                validador: ValidaLancamento.categoria,
              ),
              Editor(
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on,
                tipoTeclado: TextInputType.text,
                controlador: _contraladorCampoValor,
                validador: ValidaLancamento.valor,
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _criarLancamento(context);
                  }
                },
                child: Text(
                  _rotuloBotaoInserir,
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
            ])),
      ),
    );
  }

  void _criarLancamento(BuildContext context) {
    final double valor = double.tryParse(_contraladorCampoValor.text);
    final String categoria = _controladorListaCategoria;
    final Lancamento lancamento = new Lancamento(valor, categoria);
    if (valor != null && categoria.isNotEmpty) {
      Navigator.pop(context, lancamento);
    } else {
      debugPrint('Campo não preenchido');
    }
  }
}
