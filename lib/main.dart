import 'package:flutter/material.dart';
// import 'package:flutter_repository/screens/animaciones_page.dart';
import 'package:flutter_repository/screens/cuadrado_animado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SquareAnimatationPage(),
    );
  }
}