import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrdenTrabajo extends StatefulWidget{
  _OrdenTrabajoState createState() => _OrdenTrabajoState();
}


class _OrdenTrabajoState extends State<OrdenTrabajo>{
  final _formkey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _direccionController = TextEditingController();
  final _ubicacionController = TextEditingController();
  final _tecnicoController = TextEditingController();
  final _telefonoController = TextEditingController();
  String? _motiVisit;
  String? _estadoCivil;
  DateTime? _fechainicio;
  DateTime? _fechafinal;


//Uso del DatePicker para la fecha
  Future<void> _seleccionarFecha(BuildContext context, bool isfechas) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isfechas ? _fechainicio : _fechafinal)) {
      setState(() {
        if (isfechas) {
          _fechainicio = picked;
        } else {
          _fechafinal = picked;
        }
      });
    }
  }


  Widget build (BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [

                  DropdownButtonFormField<String>(
                    validator: (Value2){
                  if (Value2 == null || Value2.isEmpty){
                    return 'Seleccione un estado';
                  }
                  return  null;
                },
                    decoration: InputDecoration(
                      labelText: "Estado",
                      prefixIcon: Icon(Icons.assignment)
                      ),
                      value: _estadoCivil,
                      onChanged: (String? newvalue){
                        setState(() {
                          _estadoCivil = newvalue;
                        });
                      },
                      items: <String>[
                        'En Curso',
                        'Finalizado'
                      ].map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()
                        ),

              //Input Nombre
              const SizedBox(height: 25,),

              TextFormField(controller: _nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                prefixIcon: Icon(Icons.person)),
                validator: (Value){
                  if (Value == null || Value.isEmpty){
                    return 'Ingrese un Nombre valido';
                  }
                  return  null;
                },
              ),

              //Input Telefono
              const SizedBox(height: 25,),


              TextFormField(controller: _telefonoController,
              decoration: InputDecoration(
                labelText: 'Teléfono',
                prefixIcon: Icon(Icons.phone)),
                validator: (Value){
                  if (Value == null || Value.isEmpty){
                    return 'Ingrese un valor valido';
                  }
                  return  null;
                },
              ),

            // Motivo de la visita
              const SizedBox(height: 25,),
            
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Motivo de la visita: '),
                
                ),
                RadioListTile<String>(
                  
                  title: const Text('Reparación'),
                  value: 'Repara',
                  groupValue: _motiVisit,
                
                  onChanged: (String? value){
                    setState(() {
                      _motiVisit = value;
                    });
                  },
                  secondary: Icon(Icons.build),
                  
                ),
                  RadioListTile<String>(
                    
                  title: const Text('Mantenimiento Preventivo'),
                  value: 'ManPrev',
                  groupValue: _motiVisit,
                  onChanged: (String? value){
                    setState(() {
                      _motiVisit = value;
                    });
                  },
                  secondary: Icon(Icons.info_rounded),
                  
                ),
                  
                  RadioListTile<String>(
                    
                  title: const Text('Mantenimineot Correctivo'),
                  value: 'ManCorr',
                  groupValue: _motiVisit,
                  onChanged: (String? value){
                    setState(() {
                      _motiVisit = value;
                    });
                  },
                  secondary: Icon(Icons.checklist),
                  
                ),


              
              //Input Direccion
              const SizedBox(height: 25,),


              TextFormField(controller: _direccionController,
              decoration: InputDecoration(
                labelText: 'Dirección',
                prefixIcon: Icon(Icons.house)),
                validator: (Value){
                  if (Value == null || Value.isEmpty){
                    return 'Ingrese su dirección';
                  }
                  return  null;
                },
              ),

              //Ubicación Input
              const SizedBox(height: 25,),

              TextFormField(controller: _ubicacionController,
              decoration: InputDecoration(
                labelText: 'Ubicación',
                prefixIcon: Icon(Icons.location_on)),
                validator: (Value){
                  if (Value == null || Value.isEmpty){
                    return 'Ingrese su ubicación';
                  }
                  return  null;
                },
              ),

              //Fecha prevista de inicio

              const SizedBox(height: 25),
              ListTile(
                title: Text(
                  _fechainicio == null
                      ? 'Seleccione la fecha de inicio'
                      : 'Fecha de inicio: ${DateFormat('MMM d, yyyy').format(_fechainicio!)}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _seleccionarFecha(context, true),
              ),

              //Fecha de finalización              
              ListTile(
                title: Text(
                  _fechafinal == null
                      ? 'Seleccione la fecha de finalización'
                      : 'Fecha de finalización: ${DateFormat('MMM d, yyyy').format(_fechafinal!)}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _seleccionarFecha(context, false),
              ),




              //Técnico Input
              const SizedBox(height: 25,),

              TextFormField(controller: _tecnicoController,
              decoration: InputDecoration(
                labelText: 'Técnico Asignado',
                prefixIcon: Icon(Icons.assignment_ind)),
                validator: (Value){
                  if (Value == null || Value.isEmpty){
                    return 'Ingrese el técnico designado';
                  }
                  return  null;
                },
              ),

                        // Boton de Envio
                        SizedBox(height: 20,), 
                        ElevatedButton(
                          onPressed: (){
                            if(_formkey.currentState!.validate()){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Orden de Trabajo Enviada')));
                            }
                          },
                          child: Text('Enviar'),
                        )
                        
            ],
          ),
          ),
      ),
    );
  }
}

