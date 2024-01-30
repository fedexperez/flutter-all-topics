import 'backoff.dart';

/// {@template constant_backoff}
/// A constant backoff strategy.
/// This backoff strategy will always return the same value.
///
/// ```dart
/// ConstantBackoff(Duration(seconds: 1))
///   ..next() // Duration(seconds: 1)
///   ..next() // Duration(seconds: 1)
///   ..next(); // Duration(seconds: 1)
/// ```
/// {@endtemplate}
class ConstantBackoff implements Backoff {
  @override
  final int maxTimes;

  /// {@macro constant_backoff}
  const ConstantBackoff({
    this.maxTimes = 5,
    required this.duration,
  });

  /// The constant backoff duration.
  final Duration duration;

  @override
  Duration next() => duration;

  @override
  void reset() {}

  @override
  set maxTimes(int _maxTimes) {
    maxTimes = _maxTimes;
  }
}
