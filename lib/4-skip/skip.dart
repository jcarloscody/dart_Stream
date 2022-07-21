Future<void> main() async {
  var intervalo = Duration(seconds: 2);
  var stream = Stream<String>.periodic(intervalo, (v) => "Número: ${v}");

  //skip significa ignorar, logo no exemplo abaixo são ignorados dois dados no fluxo do stream
  stream = stream.take(5).skip(2);
  /*Ignora os primeiros eventos de dados [count] deste stream. - Retorna um stream que emite os mesmos eventos que esse stream faria se fosse ouvido ao mesmo tempo, exceto que os primeiros eventos de dados [count] não são emitidos. O fluxo retornado é feito quando esse fluxo é.*/

  await for (var item in stream) {
    print(item);
  }
}
