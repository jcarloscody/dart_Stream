Future<void> main() async {
  var intervalo = Duration(seconds: 2);
  var stream = Stream<int>.periodic(intervalo, (v) => v);

  //ele recebe uma condição
  stream = stream.takeWhile((element) => element < 2);

  await for (var item in stream) {
    print(item);
  }

  print("FIM");
}
