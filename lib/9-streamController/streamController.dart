import 'dart:async';

void main() async {
  //vamos criar um controlador tipado int para a stream
  final streamController = StreamController<
      int>.broadcast(); //neste controller permitindo mais de um ouvinte

  //entrada de dados - porta de entrada
  final inStream = streamController.sink;
  //saida de dados - porta de saida
  final outStream = streamController.stream;

  //recebendo os dados
  outStream
      //.take(5)
      .where((n) => n % 2 == 0)
      .map((n) => "Número par: ${n}")
      .listen((value) {
    print(value);
  });

  //mandando dados para a stream.
  var numeros = List.generate(50, (index) => index);
  for (var numero in numeros) {
    inStream.add(numero);
    await Future.delayed(Duration(milliseconds: 100));
  }

  //fechando a stream
  await streamController.close();
  print("Stream fechada");
}
