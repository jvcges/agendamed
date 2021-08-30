import 'package:agendamed/provider/patients.dart';
import 'package:agendamed/routes/app.routes.dart';
import 'package:agendamed/widgets/patients_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Patients patients = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pacientes'),
      ),
      body: ListView.builder(
        itemCount: patients.count,
        itemBuilder: (context, index) => PatientsCard(patients.byIndex(index)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.PATIENT_FORM,
          );
        },
        label: Text('Cadastrar'),
        icon: Icon(Icons.add_circle),
      ),
    );
  }
}
