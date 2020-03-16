class Lancamento {
  final double valor;
  final String categoria;

  @override
  String toString() {
    return 'Lancamento {valor: $valor, categoria: $categoria}';
  }

  Lancamento(this.valor, this.categoria);
}
