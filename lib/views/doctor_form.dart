import 'package:agendamed/models/doctor.dart';
import 'package:agendamed/provider/doctors.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DoctorForm extends StatefulWidget {
  const DoctorForm({Key? key}) : super(key: key);

  @override
  _DoctorFormState createState() => _DoctorFormState();
}

class _DoctorFormState extends State<DoctorForm> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _crmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late String nomeCompleto = "", crm = "";

  @override
  Widget build(BuildContext context) {
    // final doctor = ModalRoute.of(context)?.settings.arguments as Doctor;
    // print(doctor.name);
    // print(doctor.crm);
    final Doctors doctors = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Médico"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _nomeController,
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
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                    controller: _crmController,
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
                    }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            setState(() {});
            nomeCompleto = _nomeController.text;
            crm = _crmController.text;
            doctors.put(
              Doctor(
                id: -1,
                name: nomeCompleto,
                crm: crm,
                avatarUrl: '',
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
