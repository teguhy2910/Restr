import 'dart:math';

extension XList<T> on List<T> {
  T randomize() {
    final random = Random();
    return this[random.nextInt(length)];
  }
}
