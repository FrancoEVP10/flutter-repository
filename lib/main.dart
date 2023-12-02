import 'package:flutter/material.dart';
import 'package:flutter_repository/screens/animaciones_page.dart';
import 'package:flutter_repository/screens/controller_page.dart';
import 'package:flutter_repository/screens/cuadrado_animado.dart';
import 'package:flutter_repository/screens/headers_page.dart';
// import 'package:flutter_repository/screens/animaciones_page.dart';
// import 'package:flutter_repository/screens/cuadrado_animado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'controller_page',
      routes: {
        'controller_page': (_) => const ControllerPage(),
        'animaciones': (_) => const AnimacionesPage(),
        'cuadrado_animado': (_) => const SquareAnimatationPage(),
        'header_page': (_) => const HeaderPage(),
      },
      title: 'Widgets App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: ControllerPage(),
    );
  }
}
