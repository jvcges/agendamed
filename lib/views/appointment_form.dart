import 'package:agendamed/data/data_appointments.dart';
import 'package:agendamed/models/patient.dart';
import 'package:agendamed/views/appointment_list.dart';
import 'package:flutter/material.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({Key? key}) : super(key: key);

  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  TextEditingController _namePatient = TextEditingController();
  TextEditingController _nameDoctor = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _hour = TextEditingController();
  TextEditingController _insurance = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //late final Patient patient;

  // _PatientFormState(this.patient);

  late String namePatient = "",
      nameDoctor = "",
      date = "",
      hour = "",
      insurance = "";

  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: _namePatient,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Nome do paciente:",
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
                // DropdownButtonFormField(

                //   decoration: InputDecoration(
                //     labelText: "Médico:",
                //     border: OutlineInputBorder(),
                //     //   prefixIcon: Icon(Icons.person),
                //   ),
                //   onChanged: (newValue) {
                //     setState(() {});
                //   }, items: [],
                // ),
                TextFormField(
                  controller: _date,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "Data da consulta:",
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
                ),
                TextFormField(
                  controller: _hour,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "Hora da consulta:",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_clock_sharp),
                  ),
                  validator: (valor) {
                    if (valor!.isNotEmpty) {
                      return null;
                    } else {
                      return "Campo em branco";
                    }
                  },
                ),
                TextFormField(
                  controller: _insurance,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Convênio:",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.security),
                  ),
                  validator: (valor) {
                    if (valor!.isNotEmpty) {
                      return null;
                    } else {
                      return "Campo em branco";
                    }
                  },
                ),
                Container(
                  width: 200,
                  color: Colors.blue,
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {});
                        namePatient = _namePatient.text;
                        nameDoctor = _nameDoctor.text;
                        date = _date.text;
                        hour = _hour.text;
                        insurance = _insurance.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AppointmentList()));
                      } else {}
                    },
                    child:
                        Text("Agendar", style: TextStyle(color: Colors.white)),
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
