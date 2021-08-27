import 'package:agendamed/data/data_patient.dart';
import 'package:agendamed/widgets/patients_card.dart';
import 'package:flutter/material.dart';

class PatientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final patients = {...DATA_PATIENTS};
    return Scaffold(
      appBar: AppBar(
        title: Text('Pacientes'),
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) =>
            PatientsCard(patients.values.elementAt(index)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Cadastrar'),
        icon: Icon(Icons.add_circle),
      ),
    );
  }
}
