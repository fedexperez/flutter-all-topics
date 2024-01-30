import 'dart:io';

/// Create a WebSocket connection.
Future<WebSocket> connect(
  String url, {
  Iterable<String>? protocols,
  Duration? pingInterval,
  String? binaryType,
  Map<String, dynamic>? headers,
}) async {
  return await WebSocket.connect(
    url,
    headers: headers,
    protocols: protocols,
  )
    ..pingInterval = pingInterval;
}
