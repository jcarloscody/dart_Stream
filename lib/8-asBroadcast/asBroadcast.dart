void main() async {
  var intervalo = Duration(seconds: 2);
  var stream = Stream<int>.periodic(intervalo, (v) {
    print("stream: ${v}");
    return v;
  });

  //mesmo podendo apenas ser escutada uma vez, podemos usar o asBroadcast para fazer "dividir"
  //esta stream para ter mais de um escutador. desta forma declaramos
  stream = stream.asBroadcastStream();

  stream = stream.take(15);

  //uma coisa importante é o discarte da subscribe do stream. para isso armazenamos numa variável.
  //importante destacar que isto não descarta a strem, o fluxo continua, o que se descarta a inscrição
  var subscribe1 = stream.listen((event) {
    print("Escutador #1 ${event}");
  });

  var subscribe2 = stream.listen((event) {
    print("Escutador #2 ${event}");
    if (event == 2) {
      print("subscribe1 cancelada!");
      subscribe1.cancel(); //unsubscribe, dispose ou descartando a stream
    }
  });

  var subscribe3 = stream.listen((event) {
    print("Escutador #3 ${event}");
    if (event == 3) {
      print("subscribe2 cancelada!");
      subscribe2.cancel(); //unsubscribe, dispose ou descartando a stream
    }
  });

  Future.delayed(
    Duration(seconds: 11),
    () {
      print("Future.delayd: subscribe3 cancelada");
      subscribe3.cancel();
    },
  );

//https://api.flutter.dev/flutter/dart-async/Stream/Stream.fromFuture.html
  final streamFromFuture = Stream<String>.fromFuture(futureTask());
  streamFromFuture.listen(
    (value) => print(value),
    onDone: () => print('Done'),
    onError: (value) => print(value),
  );
}

//https://api.flutter.dev/flutter/dart-async/Stream/Stream.fromFuture.html
Future<String> futureTask() async {
  await Future.delayed(const Duration(seconds: 5));
  return 'Future complete';
}
