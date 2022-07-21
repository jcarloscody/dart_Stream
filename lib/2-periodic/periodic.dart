Future<void> main() async {
  //este stream vai executar de tempos em tempos. será um stream que não precisa de um controller, ele já tem um.
  var intervalo = Duration(seconds: 2);
  final stream = Stream<String>.periodic(intervalo, (v) => "Número: ${v}");
  final stream2 = Stream<int>.periodic(intervalo, callback);

  //é como se ficasse em loop infinito, mas não é loop infinito, o for vai ficar esperando o stream receber um valor
  await for (var item in stream) {
    print(item);
  }

//nunca vai chegar aqui
  await for (var i in stream2) {
    print(i);
  }

  print(
      "Aqui nunca será executado porque não mandei a stream parar e o for vai ficar preso.");
}

int callback(int valor) {
  return valor + 10;
}
