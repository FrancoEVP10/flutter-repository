import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color primario;
  final Color secundario;
  final double grosorPrimario;
  final double grosorSecundario;

  const RadialProgress({
    super.key,
    required this.porcentaje,
    this.primario = Colors.blue,
    this.secundario = Colors.grey,
    this.grosorPrimario = 10.0,
    this.grosorSecundario = 4.0, 
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double porcentajeAnterior = 0.0;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              (widget.porcentaje - diferenciaAnimar) +
                  (diferenciaAnimar * controller.value),
              widget.primario,
              widget.secundario,
              widget.grosorPrimario,
              widget.grosorSecundario,
            ),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  double porcentaje;
  Color primario;
  Color secundario;
  double grosorPrimario;
  double grosorSecundario;

  _MiRadialProgress(
    this.porcentaje,
    this.primario,
    this.secundario,
    this.grosorPrimario,
    this.grosorSecundario,
  );

  @override
  void paint(Canvas canvas, Size size) {
    // Circulo completado
    final paint = Paint()
      ..strokeWidth = grosorSecundario
      ..color = secundario
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Arco

    final paintArco = Paint()
      ..strokeWidth = grosorPrimario
      ..color = primario
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Parte que se debera ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
