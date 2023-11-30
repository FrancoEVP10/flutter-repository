import 'package:flutter/material.dart';
import 'package:flutter_repository/widgets/headers.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HeaderWaveGradient(),
    );
  }
}