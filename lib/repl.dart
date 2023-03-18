// dart run ./lib/repl.dart

void main() {
  print('Hello');

  final double zero = 0;
  final int one = 1; // 型推論もできる

  const double two = 2;
  const int three = 3; // こっちでも型推論できる
}
