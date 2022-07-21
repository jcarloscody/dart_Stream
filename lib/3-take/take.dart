Future<void> main() async {
  var intervalo = Duration(seconds: 1);
  var stream = Stream<String>.periodic(intervalo, (v) => "Número: ${v}");

  //ele vai pegar apenas 5 requisições. com ela vc pode fatiar a stream
  stream = stream.take(5);

  await for (var item in stream) {
    print(item);
  }
}
