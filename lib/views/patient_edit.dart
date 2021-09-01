import 'package:agendamed/models/patient.dart';
import 'package:agendamed/provider/patients.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientEdit extends StatefulWidget {
  @override
  _PatientEditState createState() => _PatientEditState();
}

class _PatientEditState extends State<PatientEdit> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Patient patient) {
    _formData['id'] = patient.id.toString();
    _formData['name'] = patient.name;
    _formData['bornDate'] = patient.bornDate;
    _formData['cpf'] = patient.cpf;
    _formData['phone'] = patient.phone;
    _formData['rg'] = patient.rg;
    _formData['avatarUrl'] = patient.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    final Patients patients = Provider.of(context);
    final patient = ModalRoute.of(context)!.settings.arguments as Patient;
    _loadFormData(patient);
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Paciente"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                  height: 15,
                ),
                TextFormField(
                  initialValue: _formData['bornDate'],
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "Data de Nascimento:",
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
                  onSaved: (valor) => _formData['bornDate'] = valor!,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  initialValue: _formData['phone'],
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Telefone:",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (valor) {
                    if (valor!.isNotEmpty) {
                      return null;
                    } else {
                      return "Campo em branco";
                    }
                  },
                  onSaved: (valor) => _formData['phone'] = valor!,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  initialValue: _formData['rg'],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "RG:",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.perm_identity),
                  ),
                  validator: (valor) {
                    if (valor!.isNotEmpty) {
                      return null;
                    } else {
                      return "Campo em branco";
                    }
                  },
                  onSaved: (valor) => _formData['rg'] = valor!,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  initialValue: _formData['cpf'],
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "CPF:",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.perm_identity),
                  ),
                  validator: (valor) {
                    if (valor!.isNotEmpty && valor.length == 11) {
                      return null;
                    } else {
                      return "CPF inválido";
                    }
                  },
                  onSaved: (valor) => _formData['cpf'] = valor!,
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
            patients.put(
              Patient(
                id: patient.id,
                name: _formData['name'].toString(),
                phone: _formData['phone'].toString(),
                bornDate: _formData['bornDate'].toString(),
                rg: _formData['rg'].toString(),
                cpf: _formData['cpf'].toString(),
                avatarUrl: patient.avatarUrl,
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
