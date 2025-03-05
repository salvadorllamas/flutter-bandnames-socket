import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

// ignore: constant_identifier_names
enum ServerStatus { online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket; // Usar `late` para evitar errores de inicialización

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket; // Getter para acceder al socket

  Function get emit => _socket.emit;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    //Dart cliente
    _socket = IO.io('http://192.168.1.16:3000', {
      'transports': ['websocket'],
      'autoConnect': true,
    });

    _socket.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    // socket.on('ejemplo', (payload) {
    //   print("si estoy entrando");
    //   print("Nuevo mensaje recibido: $payload");
    // });
  }
}
