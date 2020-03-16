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

class ListaLancamento extends StatefulWidget {
  final List<Lancamento> _listaLancamentos = List();
  @override
  _ListaLancamentoState createState() => _ListaLancamentoState();
}

class _ListaLancamentoState extends State<ListaLancamento> {


  @override
  Widget build(BuildContext context) {
//    _listaLancamentos.add(Lancamento(-100, 'Teste'));
//    _listaLancamentos.add(Lancamento(100, 'Teste'));
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Dívidas"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: widget._listaLancamentos.length, itemBuilder: (context, index) {
        final lancamento = widget._listaLancamentos[index];
        return ItemLancamento(lancamento);
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Lancamento> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormLancamento();
            }),
          );
          future.then((lancamento) {
            Future.delayed(Duration(milliseconds: 30), (){
              debugPrint('chegou no then do future');
              debugPrint('$lancamento');
              if (lancamento != null){
                setState(() {
                  widget._listaLancamentos.add(lancamento);
                });
              }
            });
          });
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

  @override
  String toString() {
    return 'Lancamento {valor: $valor, categoria: $categoria}';
  }

  Lancamento(this.valor, this.categoria);
}

class FormLancamento extends StatelessWidget {
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
            CamposForm(
              rotulo: 'Categoria',
              dica: 'Exemplo: Almoço',
              icone: Icons.create,
              tipoTeclado: TextInputType.text,
              controlador: _controladorCampoCategoria,
            ),
            CamposForm(
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

class CamposForm extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;
  final TextInputType tipoTeclado;

  CamposForm({
    this.controlador,
    this.rotulo,
    this.dica,
    this.icone,
    this.tipoTeclado,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controlador,
      style: TextStyle(
        fontSize: 24.0,
      ),
      decoration: InputDecoration(
        icon: Icon(icone),
        labelText: rotulo,
        hintText: dica,
      ),
      keyboardType: TextInputType.text,
    );
  }
}
