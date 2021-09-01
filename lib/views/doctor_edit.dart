import 'package:agendamed/models/doctor.dart';
import 'package:agendamed/provider/doctors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorEdit extends StatefulWidget {
  @override
  _DoctorEditState createState() => _DoctorEditState();
}

class _DoctorEditState extends State<DoctorEdit> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Doctor doctor) {
    _formData['id'] = doctor.id.toString();
    _formData['name'] = doctor.name;
    _formData['crm'] = doctor.crm;
    _formData['avatarUrl'] = doctor.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    final Doctors doctors = Provider.of(context);
    final doctor = ModalRoute.of(context)!.settings.arguments as Doctor;
    _loadFormData(doctor);
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Médico"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  initialValue: _formData['name'],
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Nome Completo:",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (valor) {
                    if (valor!.isNotEmpty) {
                      return null;
                    } else {
                      return "Campo em branco";
                    }
                  },
                  onSaved: (valor) => _formData['name'] = valor!,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  initialValue: _formData['crm'],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "CRM:",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.date_range_outlined),
                  ),
                  validator: (valor) {
                    if (valor!.isNotEmpty) {
                      return null;
                    } else {
                      return "Campo em branco";
                    }
                  },
                  onSaved: (valor) => _formData['crm'] = valor!,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_form.currentState!.validate()) {
            _form.currentState!.save();
            setState(() {});
            doctors.put(
              Doctor(
                id: doctor.id,
                name: _formData['name'].toString(),
                crm: _formData['crm'].toString(),
                avatarUrl: doctor.avatarUrl,
              ),
            );
            Navigator.of(context).pop();
          } else {}
        },
        label: Text('Salvar'),
        icon: Icon(Icons.person_add_alt_1_sharp),
      ),
    );
  }
}
