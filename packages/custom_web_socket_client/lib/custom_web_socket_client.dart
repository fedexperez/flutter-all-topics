/// A reusable custom WebSocket client.
library custom_web_socket_client;

export 'package:web_socket_channel/web_socket_channel.dart'
    show WebSocketChannelException;
export 'src/backoff/backoff.dart' show Backoff;
export 'src/backoff/binary_exponential_backoff.dart'
    show BinaryExponentialBackoff;
export 'src/backoff/constant_backoff.dart' show ConstantBackoff;
export 'src/backoff/linear_backoff.dart' show LinearBackoff;
export 'src/connection/connection.dart' show Connection;
export 'src/connection/connection_state.dart'
    show
        Connected,
        Connecting,
        ConnectionState,
        Disconnected,
        Disconnecting,
        Reconnected,
        Reconnecting;
export 'src/web_socket_client.dart' show WebSocketClient;
