import 'package:band_names/src/services/socket_service.dart';
import 'package:band_names/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SocketService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          "home": (_) => HomePage(),
          "status": (_) => StatusPage(),
        },
      ),
    );
  }
}
