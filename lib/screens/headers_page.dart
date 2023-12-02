import 'package:flutter/material.dart';
import 'package:flutter_repository/widgets/headers.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Header Page',
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
          child: ListView(
        children: [
          ListTile(
            title: Text('Header Cuadrado'),
            subtitle: Text('Header Cuadrado'),
            leading: Icon(Icons.animation),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Scaffold(
                            body: HeaderCuadrado(),
                          )));
            },
          ),
          ListTile(
            title: Text('Header Bordes Redondeados'),
            subtitle: Text('Header Bordes Redondeados'),
            leading: Icon(Icons.animation),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Scaffold(
                            body: HeaderBordesRedondeados(),
                          )));
            },
          ),
          ListTile(
            title: Text('Header Diagonal'),
            subtitle: Text('Header Diagonal'),
            leading: Icon(Icons.animation),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Scaffold(
                            body: HeaderDiagonal(),
                          )));
            },
          ),
          ListTile(
            title: Text('Header Triangular'),
            subtitle: Text('Header Triangular'),
            leading: Icon(Icons.animation),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Scaffold(
                            body: HeaderTriangular(),
                          )));
            },
          ),
          ListTile(
            title: Text('Header Pico'),
            subtitle: Text('Header Pico'),
            leading: Icon(Icons.animation),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Scaffold(
                            body: HeaderPico(),
                          )));
            },
          ),
          ListTile(
            title: Text('Header Curvo'),
            subtitle: Text('Header Curvo'),
            leading: Icon(Icons.animation),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Scaffold(
                            body: HeaderCurvo(),
                          )));
            },
          ),
          ListTile(
            title: Text('Header Wave'),
            subtitle: Text('Header Wave'),
            leading: Icon(Icons.animation),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Scaffold(
                            body: HeaderWave(),
                          )));
            },
          ),
          ListTile(
            title: Text('Header Wave Gradient'),
            subtitle: Text('Header Wave Gradient'),
            leading: Icon(Icons.animation),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Scaffold(
                            body: HeaderWaveGradient(),
                          )));
            },
          ),
        ],
      )),
    );
  }
}
