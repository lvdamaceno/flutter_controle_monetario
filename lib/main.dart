// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';

void main() => runApp(to_liso_app());

class to_liso_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: ListaLancamento());
  }
}

class ListaLancamento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Dívidas"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ItemLancamento(new Lancamento(100, 'Rendimento')),
          ItemLancamento(new Lancamento(-120, 'Farmácia')),
          ItemLancamento(new Lancamento(-150, 'Almoço')),
          ItemLancamento(new Lancamento(200, 'Rendimento')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){

        },
      ),
    );
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

class Lancamento {
  final double valor;
  final String categoria;

  Lancamento(this.valor, this.categoria);
}
