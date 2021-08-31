import 'package:agendamed/provider/patients.dart';
import 'package:provider/provider.dart';
import '../models/patient.dart';
import 'package:flutter/material.dart';

class PatientForm extends StatefulWidget {
  const PatientForm({Key? key}) : super(key: key);

  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _dataNascimentoController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _rgController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //late final Patient patient;

  // _PatientFormState(this.patient);

  late String nomeCompleto = "",
      dataNascimento = "",
      telefone = "",
      rg = "",
      cpf = "";

  @override
  Widget build(BuildContext context) {
    final Patients patients = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Paciente"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 30,
                // ),
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
                  height: 15,
                ),
                TextFormField(
                    controller: _dataNascimentoController,
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
                    }),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _telefoneController,
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
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _rgController,
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
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _cpfController,
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
                ),
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
            dataNascimento = _dataNascimentoController.text;
            telefone = _telefoneController.text;
            rg = _rgController.text;
            cpf = _cpfController.text;
            patients.put(
              Patient(
                id: -1,
                name: nomeCompleto,
                phone: telefone,
                bornDate: dataNascimento,
                rg: rg,
                cpf: cpf,
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
