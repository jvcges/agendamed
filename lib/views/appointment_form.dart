import 'package:agendamed/data/data_appointments.dart';
import 'package:agendamed/models/appointment.dart';
import 'package:agendamed/models/patient.dart';
import 'package:agendamed/provider/appointments.dart';
import 'package:agendamed/provider/doctors.dart';
import 'package:agendamed/provider/patients.dart';
import 'package:agendamed/views/appointment_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final List<String> listItemPatient = [
    'Walter Kanneman',
    'Mathias Villasanti',
    'Gabriel Chapecó',
  ];
  final List<String> listItemDoctor = [
    'Douglas Costa',
    'Miguel Borja',
    'Pedro Geromel'
  ];

  late String valueChoosePatient = listItemPatient.first;
  late String valueChooseDoctor = listItemDoctor.first;

  @override
  Widget build(BuildContext context) {
    final Appointments appointments = Provider.of(context);
    final Patients patients = Provider.of(context);
    final Doctors doctors = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Consulta"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Nome do paciente:",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  value: valueChoosePatient,
                  items: listItemPatient
                      .map(
                        (item) => DropdownMenuItem<String>(
                          child: Text(
                            item,
                          ),
                          value: item,
                        ),
                      )
                      .toList(),
                  onChanged: (value) => setState(() {
                    this.valueChoosePatient = valueChoosePatient;
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Nome do Médico:",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  value: valueChooseDoctor,
                  items: listItemDoctor
                      .map(
                        (item) => DropdownMenuItem<String>(
                          child: Text(
                            item,
                            //style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          value: item,
                        ),
                      )
                      .toList(),
                  onChanged: (value) => setState(() {
                    this.valueChooseDoctor = valueChooseDoctor;
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
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
                SizedBox(
                  height: 20,
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
                SizedBox(
                  height: 20,
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
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          appointments.put(Appointment(
              id: -1,
              patient: patients.byIndex(0),
              doctor: doctors.byIndex(0),
              date: _date.text,
              hour: _hour.text,
              insurance: _insurance.text,
              newAppointment: true));
          Navigator.of(context).pop();
        },
        label: Text('Agendar'),
        icon: Icon(Icons.person_add_alt_1_sharp),
      ),
    );
  }
}
