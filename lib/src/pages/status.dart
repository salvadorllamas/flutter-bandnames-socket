import 'package:band_names/src/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(),
            Text(
              'Estado del servidor: ${socketService.serverStatus.name}', // .name para obtener el string
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          try {
            socketService.emit("emitir-mensaje", {
              'nombre': 'flutter',
              'mensaje': 'Hola desde Flutter',
              'edad': 23
            });
          } catch (e) {
            // print("Error al emitir mensaje: $e");
          }
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
