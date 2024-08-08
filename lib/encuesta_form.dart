import 'package:flutter/material.dart';

class EncuestaForm extends StatefulWidget {
  @override
  _EncuestaFormState createState() => _EncuestaFormState();
}

class _EncuestaFormState extends State<EncuestaForm> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  String? _satisfaccion;
  String? _recomendacion;
  String? _comentarios;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Nombre
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              
              // Email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Nivel de Satisfacción
              Text('Nivel de Satisfacción:'),
              RadioListTile<String>(
                title: const Text('Muy Satisfecho'),
                value: 'Muy Satisfecho',
                groupValue: _satisfaccion,
                onChanged: (value) {
                  setState(() {
                    _satisfaccion = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Satisfecho'),
                value: 'Satisfecho',
                groupValue: _satisfaccion,
                onChanged: (value) {
                  setState(() {
                    _satisfaccion = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Neutral'),
                value: 'Neutral',
                groupValue: _satisfaccion,
                onChanged: (value) {
                  setState(() {
                    _satisfaccion = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Insatisfecho'),
                value: 'Insatisfecho',
                groupValue: _satisfaccion,
                onChanged: (value) {
                  setState(() {
                    _satisfaccion = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Muy Insatisfecho'),
                value: 'Muy Insatisfecho',
                groupValue: _satisfaccion,
                onChanged: (value) {
                  setState(() {
                    _satisfaccion = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Recomendación
              Text('¿Recomendarías nuestro servicio?'),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Recomendación',
                  prefixIcon: Icon(Icons.thumb_up),
                ),
                value: _recomendacion,
                onChanged: (newValue) {
                  setState(() {
                    _recomendacion = newValue;
                  });
                },
                items: <String>['Sí', 'No'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, seleccione una opción';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Comentarios
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Comentarios',
                  prefixIcon: Icon(Icons.comment),
                ),
                onChanged: (value) {
                  setState(() {
                    _comentarios = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Enviar
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Encuesta enviada')),
                    );
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
