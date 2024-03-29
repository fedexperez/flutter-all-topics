/// {@template backoff}
/// An backoff strategy abstraction.
/// A backoff strategy is a technique used to re-attempt
/// failing calls after a delay.
///
/// Some common backoff strategies are:
/// * Constant Backoff
/// * Linear Backoff
/// * Exponential Backoff
/// {@endtemplate}
abstract class Backoff {
  /// Number of times to retry the connection
  int maxTimes;

  Backoff({this.maxTimes = 5});

  /// Get the next duration in the series.
  Duration next();

  /// Reset the backoff to its initial state.
  void reset();
}
