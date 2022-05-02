void main() async {
  //este stream vai executar de tempos em tempos
  var intervalo = Duration(seconds: 2);
  final stream = Stream<String>.periodic(intervalo, (v) => "Número: ${v}");

  //é como se ficasse em loop infinito, mas não é loop infinito, o for vai ficar esperando o stream receber um valor
  await for (var item in stream) {
    print(item);
  }

  print(
      "Aqui nunca será executado porque não mandei a stream parar e o for vai ficar preso.");
}
