// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.
import 'package:flutter/material.dart';
import 'package:to_liso/screens/lancamento/lista.dart';

void main() => runApp(to_liso_app());

class to_liso_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: ListaLancamento());
  }
}
