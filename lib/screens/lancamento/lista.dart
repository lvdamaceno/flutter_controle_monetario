import 'package:flutter/material.dart';
import 'package:to_liso/models/lancamento.dart';
import 'package:to_liso/screens/lancamento/formulario.dart';

const _tituloAppBar = 'Controle Financeiro';

class ListaLancamento extends StatefulWidget {
  final List<Lancamento> _listaLancamentos = List();

  @override
  _ListaLancamentoState createState() => _ListaLancamentoState();
}

class _ListaLancamentoState extends State<ListaLancamento> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: widget._listaLancamentos.length,
          itemBuilder: (context, index) {
            final lancamento = widget._listaLancamentos[index];
            return ItemLancamento(lancamento);
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormLancamento();
            })).then((lancamento) => _atualiza(lancamento));
          }),
    );
  }

  void _atualiza(lancamento) {
    if (lancamento != null) {
      setState(() {
        widget._listaLancamentos.add(lancamento);
      });
    }
  }
}

class ItemLancamento extends StatelessWidget {
  final Lancamento _lancamento;

  ItemLancamento(this._lancamento);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListTile(
        //leading: Icon(Icons.monetization_on),
        leading: _lancamento.valor < 0
            ? Icon(Icons.money_off)
            : Icon(Icons.monetization_on),
        title: Text(
          _lancamento.valor.toString(),
          style: _lancamento.valor < 0
              ? TextStyle(color: Colors.red)
              : TextStyle(color: Colors.green),
        ),
        subtitle: Text(_lancamento.categoria),
      ),
    );
  }
}
