import 'dart:io';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Get an [IOWebSocketChannel] for the provided [socket].
WebSocketChannel getWebSocketChannel(WebSocket socket) {
  return IOWebSocketChannel(socket);
}
