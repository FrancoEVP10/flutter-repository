import 'package:flutter/material.dart';

class ControllerPage extends StatelessWidget {
  const ControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Controller Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Text('Animaciones'),
              subtitle: Text('Animaciones'),
              leading: Icon(Icons.animation),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, 'animaciones');
              },
            ),
            ListTile(
              title: Text('Cuadrado Animado'),
              subtitle: Text('Cuadrado Animado'),
              leading: Icon(Icons.animation),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, 'cuadrado_animado');
              },
            ),
            ListTile(
              title: Text('Header Page'),
              subtitle: Text('Header Page'),
              leading: Icon(Icons.animation),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, 'header_page');
              },
            ),
            ListTile(
              title: Text('Circular Progress Page'),
              subtitle: Text('Circular Progress  Page'),
              leading: Icon(Icons.animation),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, 'circular_progress_page');
              },
            ),
            ListTile(
              title: Text('Graficas Circulares Page'),
              subtitle: Text('Graficas Circulares Page'),
              leading: Icon(Icons.animation),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, 'graficas_circulares_page');
              },
            ),
            ListTile(
              title: Text('Slideshow Page'),
              subtitle: Text('Slideshow Page'),
              leading: Icon(Icons.animation),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, 'slideshow_page');
              },
            ),
          ],
        ),
      ),
    );
  }
}
