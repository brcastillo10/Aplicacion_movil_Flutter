// cliente_form.dart
import 'package:flutter/material.dart';
import 'database_cuarto.dart';

class ClienteForm extends StatefulWidget {
  @override
  _ClienteFormState createState() => _ClienteFormState();
}

class _ClienteFormState extends State<ClienteForm> {
  final _formkey = GlobalKey<FormState>();
  final _apellidoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _telefonoController = TextEditingController();
  String? _sexo;
  String? _estadoCivil;

  late DatabaseCuarto _databaseCuarto;

  @override
  void initState() {
    super.initState();
    _databaseCuarto = DatabaseCuarto();
  }

  void _addCliente() async {
    if (_formkey.currentState!.validate()) {
      Map<String, dynamic> client = {
        'apellido': _apellidoController.text,
        'nombre': _nombreController.text,
        'correo': _correoController.text,
        'telefono': _telefonoController.text,
      };
      await _databaseCuarto.insertCliente(client);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              const SizedBox(height: 25),
              TextFormField(
                controller: _apellidoController,
                decoration: InputDecoration(
                    labelText: 'Apellidos', prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese un Apellido valido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                    labelText: 'Nombre', prefixIcon: Icon(Icons.person_4_rounded)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese un Nombre valido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: _correoController,
                decoration: InputDecoration(
                    labelText: 'Correo Eletrónico', prefixIcon: Icon(Icons.email)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese un correo valido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: _telefonoController,
                decoration: InputDecoration(
                    labelText: 'Teléfono', prefixIcon: Icon(Icons.phone)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese un valor valido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Sexo: '),
              ),
              RadioListTile<String>(
                title: const Text('Masculino'),
                value: 'Macho',
                groupValue: _sexo,
                onChanged: (String? value) {
                  setState(() {
                    _sexo = value;
                  });
                },
                secondary: Icon(Icons.male),
              ),
              RadioListTile<String>(
                title: const Text('Femenino'),
                value: 'Hembra',
                groupValue: _sexo,
                onChanged: (String? value) {
                  setState(() {
                    _sexo = value;
                  });
                },
                secondary: Icon(Icons.female),
              ),
              DropdownButtonFormField<String>(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Seleccione un estado civil tenga la bondad';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Estado Civil", prefixIcon: Icon(Icons.family_restroom)),
                value: _estadoCivil,
                onChanged: (String? newvalue) {
                  setState(() {
                    _estadoCivil = newvalue;
                  });
                },
                items: <String>[
                  'Soltero',
                  'Casado',
                  'Divorcioado',
                  'Richard',
                  'Viudo',
                  'En proceso de amorio',
                  'Amante',
                  'En amarre',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addCliente,
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
