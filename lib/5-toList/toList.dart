Future<void> main() async {
  var intervalo = Duration(seconds: 2);
  var stream = Stream<String>.periodic(intervalo, (v) => "Número: ${v}");

  stream = stream.take(5);

  // vamos fazer com que o stream pareça ser uma forma "síncrona" fazendo com que o
  // retorno seja de uma vez só. vamos resgatar todos os valores dela de apenas uma vez

  final data = await stream.toList();

  print(data);
}
