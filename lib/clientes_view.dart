import 'package:flutter/material.dart';
import 'database_cuarto.dart';

class ClientesView extends StatefulWidget {
  @override
  _ClientesViewState createState() => _ClientesViewState();
}

class _ClientesViewState extends State<ClientesView> {
  late DatabaseCuarto _databaseCuarto;
  List<Map<String, dynamic>> _clientes = [];

  @override
  void initState() {
    super.initState();
    _databaseCuarto = DatabaseCuarto();
    _loadClientes();
  }

  void _loadClientes() async {
    List<Map<String, dynamic>> clientes = await _databaseCuarto.getAllClientes();
    setState(() {
      _clientes = clientes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false; // Bloquear el retroceso
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Clientes Registrados'),
          automaticallyImplyLeading: false, // Ocultar botón de retroceso
        ),
      body: _clientes.isEmpty
          ? Center(child: Text('No hay clientes registrados'))
          : ListView.builder(
              itemCount: _clientes.length,
              itemBuilder: (context, index) {
                final cliente = _clientes[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    title: Text('${cliente['nombre']} ${cliente['apellido']}'),
                    subtitle: Text('Correo: ${cliente['correo']}\nTeléfono: ${cliente['telefono']}'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sexo: ${cliente['sexo'] ?? 'No especificado'}'),
                        Text('Estado Civil: ${cliente['estadoCivil'] ?? 'No especificado'}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    ));
  }
}
