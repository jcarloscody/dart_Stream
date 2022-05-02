void main() async {
  var intervalo = Duration(milliseconds: 50);
  var stream = Stream<int>.periodic(intervalo, (v) => v);

  //descarta se não atender a condição. é mesma coisa do skipWhile inverso !=
  stream = stream.where((event) => event % 6 == 0).take(5);
  //stream = stream.skipWhile((event) => event % 6 != 0).take(5);

  stream.listen((event) {
    print("Divisível por 6: ${event}");
  });
}
