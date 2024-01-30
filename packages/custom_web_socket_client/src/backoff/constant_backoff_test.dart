import 'package:test/test.dart';

import 'package:custom_web_socket_client/custom_web_socket_client.dart';

void main() {
  group('ConstantBackoff', () {
    test('next() returns a constant duration.', () {
      const duration = Duration(seconds: 1);
      const backoff = ConstantBackoff(duration: duration);
      const intervals = 10;

      final expected = List.generate(intervals, (_) => duration);
      final actual = List.generate(intervals, (_) => backoff.next());

      expect(actual, equals(expected));
    });

    test('reset does nothing.', () {
      const duration = Duration(seconds: 42);
      const backoff = ConstantBackoff(duration: duration);

      expect(backoff.next(), equals(duration));
      expect(backoff.reset, returnsNormally);
      expect(backoff.next(), equals(duration));
    });
  });
}
