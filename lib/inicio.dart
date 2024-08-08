import 'package:flutter/material.dart';
import 'login_format.dart';

class InicioHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CastleSoft'),
        automaticallyImplyLeading: false, // Esto elimina la flecha de retroceso
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginForm()),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 160, 212, 255), // Color de fondo del botón
              padding: EdgeInsets.symmetric(horizontal: 16.0), // Espaciado interno
            ),
            child: Text(
              'Iniciar Sesión',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Alinea al inicio del contenido
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Image.asset('asset/Logo.png',
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Bienvenido a Nuestra Empresa',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Somos una empresa dedicada a la venta de componentes. '
              'Nuestro objetivo es facilitar la compra de componentes para tu computador y ofrecerte la mayor calidad posible.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
