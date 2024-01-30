import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

import '_web_socket_channel/_web_socket_channel.dart'
    if (dart.library.io) '_web_socket_connect/_web_socket_connect_io.dart'
    if (dart.library.html) '_web_socket_connect/_web_socket_connect_html.dart';
import '_web_socket_connect/_web_socket_connect.dart'
    if (dart.library.io) '_web_socket_channel/_web_socket_channel_io.dart'
    if (dart.library.html) '_web_socket_channel/_web_socket_channel_html.dart';
import 'backoff/backoff.dart';
import 'backoff/binary_exponential_backoff.dart';
import 'connection/connection.dart';
import 'connection/connection_state.dart';

/// The default backoff strategy.
final _defaultBackoff = BinaryExponentialBackoff(
  initial: const Duration(milliseconds: 100),
  maximumStep: 4,
);

/// The default connection timeout duration.
const _defaultTimeout = Duration(seconds: 60);

/// {@template web_socket}
/// A reusable WebSocket client for Dart.
/// {@endtemplate}
class WebSocketClient {
  final Uri _uri;
  final Iterable<String>? _protocols;
  final Duration? _pingInterval;
  final Backoff _backoff;
  final Duration _timeout;
  final String? _binaryType;
  final Map<String, dynamic>? _headers;

  /// {@macro web_socket}
  WebSocketClient({
    required Uri uri,
    Iterable<String>? protocols,
    Duration? pingInterval,
    Backoff? backoff,
    Duration? timeout,
    String? binaryType,
    Map<String, dynamic>? headers,
  })  : _uri = uri,
        _protocols = protocols,
        _pingInterval = pingInterval,
        _backoff = backoff ?? _defaultBackoff,
        _timeout = timeout ?? _defaultTimeout,
        _binaryType = binaryType,
        _headers = headers;

  final _messageController = StreamController<dynamic>.broadcast();
  final _connectionController = ConnectionController();

  int reconnectAttempts = 0;
  Timer? _backoffTimer;
  WebSocketChannel? _channel;

  bool get _isConnected {
    return _connectionController.state is Connected ||
        _connectionController.state is Reconnected ||
        _connectionController.state is Disconnecting;
  }

  bool get _isReconnecting {
    return _connectionController.state == const Reconnecting();
  }

  bool get _isDisconnecting {
    return _connectionController.state == const Disconnecting();
  }

  bool _isClosedByClient = false;

  Map<String, dynamic> get headers => _headers ?? {};

  set headers(Map<String, dynamic> headers) {
    _headers!.addAll(headers);
  }

  /// The stream of messages received from the WebSocket server.
  Stream<dynamic> get stream => _messageController.stream;

  /// The WebSocket [Connection].
  Connection get connection => _connectionController;

  /// Enqueues the specified data to be transmitted
  /// to the server over the WebSocket connection.
  void add(dynamic message) => _channel?.sink.add(message);

  Future<void> connectSocket() async {
    if (_isConnected) return;

    void attemptToReconnect([Object? error, StackTrace? stackTrace]) {
      if (_isClosedByClient || _isReconnecting || _isDisconnecting) return;
      _connectionController.add(
        Disconnected(
          code: _channel?.closeCode,
          reason: _channel?.closeReason,
          error: error,
          stackTrace: stackTrace,
        ),
      );
      _channel = null;
      _reconnect();
    }

    try {
      final webSocket = await connect(
        this._uri.toString(),
        protocols: this._protocols,
        pingInterval: this._pingInterval,
        binaryType: this._binaryType,
        headers: this._headers,
      ).timeout(this._timeout);

      final connectionState = _connectionController.state;
      if (connectionState is Reconnecting) {
        _connectionController.add(const Reconnected());
      } else if (connectionState is Connecting) {
        _connectionController.add(const Connected());
      }

      _channel = getWebSocketChannel(webSocket);
      _channel!.stream.listen(
        (message) {
          if (_messageController.isClosed) return;
          _messageController.sink.add(message);
        },
        onDone: attemptToReconnect,
        cancelOnError: true,
      );
    } catch (error, stackTrace) {
      attemptToReconnect(error, stackTrace);
    }
  }

  Future<void> _reconnect() async {
    if (_isClosedByClient || _isConnected) return;

    // Check if the maximum reconnect attempts have been reached.
    if (reconnectAttempts >= _backoff.maxTimes) {
      _connectionController.add(const Disconnected());
      reconnectAttempts = 0;
      return;
    }

    _connectionController.add(const Reconnecting());
    reconnectAttempts++;

    await connectSocket();

    if (_isClosedByClient || _isConnected) {
      _backoff.reset();
      _backoffTimer?.cancel();
      return;
    }

    _backoffTimer?.cancel();
    print('Reconnecting attempt $reconnectAttempts');
    _backoffTimer = Timer(_backoff.next(), _reconnect);
  }

  /// Closes the connection and frees any resources.
  void close([int? code, String? reason]) {
    if (_connectionController.state is Disconnected) return;
    _isClosedByClient = true;
    _backoffTimer?.cancel();
    _connectionController.add(const Disconnecting());
    Future.wait<void>([
      if (_channel != null) _channel!.sink.close(code, reason),
    ]).whenComplete(() {
      _connectionController.add(Disconnected(code: code, reason: reason));
      _messageController.close();
      _connectionController.close();
    });
  }
}
