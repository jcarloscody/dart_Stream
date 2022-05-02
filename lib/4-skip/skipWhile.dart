void main() async {
  var intervalo = Duration(seconds: 1);
  var stream = Stream<int>.periodic(intervalo, (v) => v);

  //ele recebe uma condição - vai pular toda vez que o dado for menor que 10
  stream = stream.skipWhile((element) => element < 10);

  await for (var item in stream) {
    print(item);
  }

  print("FIM");
}
