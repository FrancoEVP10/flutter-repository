import 'package:flutter/material.dart';

class SquareAnimatationPage extends StatelessWidget {
  const SquareAnimatationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({super.key});

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoPageState();
}

class _CuadradoAnimadoPageState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4500),
    );

    moverDerecha = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.25, curve: Curves.bounceOut),
      ),
    );

    moverArriba = Tween(
      begin: 0.0,
      end: -100.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.5, curve: Curves.bounceOut),
      ),
    );

    moverIzquierda = Tween(
      begin: 0.0,
      end: -100.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.75, curve: Curves.bounceOut),
      ),
    );

    moverAbajo = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut),
      ),
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(moverDerecha.value + moverIzquierda.value,
              moverArriba.value + moverAbajo.value),
          child: _Rectangulo(),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
