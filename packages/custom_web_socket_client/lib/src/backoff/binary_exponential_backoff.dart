import 'backoff.dart';

/// {@template binary_exponential_backoff}
/// A binary exponential backoff strategy.
/// This backoff strategy will double the backoff duration on each attempt
/// until the maximum step is reached.
///
/// ```dart
/// final backoff = BinaryExponentialBackoff(
///   initial: Duration(milliseconds: 100),
///   maximumStep: 7,
/// );
///
/// backoff.next(); // Duration(milliseconds: 100)
/// backoff.next(); // Duration(milliseconds: 200)
/// backoff.next(); // Duration(milliseconds: 400);
/// backoff.next(); // Duration(milliseconds: 800);
/// backoff.next(); // Duration(milliseconds: 1600);
/// backoff.next(); // Duration(milliseconds: 3200);
/// backoff.next(); // Duration(milliseconds: 6400);
/// backoff.next(); // Duration(milliseconds: 6400);
/// ```
/// {@endtemplate}
class BinaryExponentialBackoff implements Backoff {
  /// The initial backoff duration.
  final Duration initial;

  /// The maximum number of times the backoff duration is doubled.
  final int maximumStep;

  @override
  int maxTimes;

  /// {@macro binary_exponential_backoff}
  BinaryExponentialBackoff({
    this.maxTimes = 5,
    required this.initial,
    required this.maximumStep,
  })  : _currentStep = 1,
        _current = initial;

  int _currentStep;
  Duration _current;

  @override
  Duration next() {
    final backoff = _current;
    if (maximumStep > _currentStep++) _current = _current * 2;
    return backoff;
  }

  @override
  void reset() {
    _currentStep = 1;
    _current = initial;
  }
}
