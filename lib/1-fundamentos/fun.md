# Stream

## Processos Assíncronos no Dart
- É representado por duas classes:
  - Future (futuro)
    - é usado para representar um valor ou um erro que estará disponível em algum momento no futuro.
    - ela tem uma promessa de que irá responder algo no futuro
    - você receberá apenas `um único resultado (sucesso ou erro)`
  - `Stream` (fluxo): são fluxos de dados 
    - leva o mesmo conceito de Future.
    - você receberá `vários resultados`, ou seja, uma combinação de Futures.
    - é como se fosse um canal aberto, enquanto não fechar continuará aberto.
    - `await` não é permitido usar num Future, porque a todo o momento é enviado dados.
