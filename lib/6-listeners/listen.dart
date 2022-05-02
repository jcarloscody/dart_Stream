void main() async {
  print("Início do programa!");

  var intervalo = Duration(seconds: 2);
  var stream = Stream<String>.periodic(intervalo, (v) => "Número: ${v}");

  stream = stream.take(10);

  //com o await for o programa ficava parado, mas agora usaremos uma forma de escuta da stream
  //evitando o congestionamento do sistema.
  //o listener retorna um subscribe, ou seja, houve uma subscrição na stream para receber valores
  stream.listen((valor) {
    print(valor);
  });

  print(
      "Executou o programa de ponta a ponta sem fazer o congestionamento por causa do Stream");
}
