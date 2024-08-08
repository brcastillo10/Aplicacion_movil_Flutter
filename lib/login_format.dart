import 'package:flutter/material.dart';
import 'menu.dart';
import 'inicio.dart'; // Asegúrate de importar la página de inicio

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final String claveCorrecta = 'a';
  final String _userCorreto = 'a';

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false; // Bloquear el retroceso
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Iniciar Sesión'),
          automaticallyImplyLeading: false, // Ocultar botón de retroceso
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      'asset/GokuIcon.jpg',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese su Username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese la contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      if (_passwordController.text == claveCorrecta &&
                          _usernameController.text == _userCorreto) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuFormPage(
                              body: Center(child: Text('Bienvenido al menú principal')),
                              title: 'CastleSoft XYZ',
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Las credenciales no coinciden')),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Formulario Invalido')),
                      );
                    }
                  },
                  child: Text('Enviar'),
                ),
                const SizedBox(height: 10), // Espacio entre botones
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InicioHome()), // Redirige a la página de inicio
                    );
                  },
                  child: Text(
                    'Volver al Inicio',
                    style: TextStyle(
                      color: Colors.blue, // Cambia el color del texto si es necesario
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
