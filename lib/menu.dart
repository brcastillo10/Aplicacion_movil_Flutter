// menu.dart
import 'package:flutter/material.dart';
import 'cliente_form.dart';
import 'orden_trabajo.dart';
import 'encuesta_form.dart';
import 'localizacion.dart';
import 'login_format.dart';
import 'productos.dart';
import 'inicio.dart';
import 'clientes_view.dart';
class MenuFormPage extends StatelessWidget {
  final Widget body;
  final String title;

  MenuFormPage({required this.body, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('asset/login.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.black),
              title: Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuFormPage(
                    body: Center(child: Text('Bienvenido al menú principal')), 
                    title: 'CastleSoft XYZ',
                  )),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.black),
              title: Text('Clientes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuFormPage(
                    body: ClienteForm(), 
                    title: 'Formulario Cliente',
                  )),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.app_registration, color: Colors.black),
              title: Text('Clientes Registados'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuFormPage(
                    body: ClientesView(), 
                    title: 'Clientes',
                  )),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work, color: Colors.black),
              title: Text('Orden de trabajo'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuFormPage(
                    body: OrdenTrabajo(), 
                    title: 'Orden de Trabajo',
                  ))
                );
              },
            ),
            
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text('Encuestas'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuFormPage(
                    body: EncuestaForm(), 
                    title: 'Encuesta de Satisfacción',
                  ))
                  );
              },
            ),
              ListTile(
              leading: Icon(Icons.location_on_sharp, color: Colors.black),
              title: Text('Localización'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuFormPage(
                    body: MapSample(), 
                    title: 'Localización',
                  ))
                );
              },
            ),
              ListTile(
              leading: Icon(Icons.production_quantity_limits_sharp, color: Colors.black),
              title: Text('Productos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuFormPage(
                    body: ProductScreen(), 
                    title: 'Productos',
                  ))
                );
              },
            ),
              ListTile(
              leading: Icon(Icons.logout, color: Colors.black),
              title: Text('Cerrar Sesión'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginForm()
                  )
                );
              },
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MenuFormPage(
      body: Center(child: Text('Bienvenido al menú principal')), 
      title: 'CastleSoft XYZ',
    ),
  ));
}
