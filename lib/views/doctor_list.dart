import 'package:agendamed/models/doctor.dart';
import 'package:agendamed/provider/doctors.dart';
import 'package:agendamed/routes/app.routes.dart';
import 'package:agendamed/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Doctors doctors = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Médicos'),
      ),
      body: ListView.builder(
        itemCount: doctors.count,
        itemBuilder: (context, index) => DoctorCard(doctors.byIndex(index)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.DOCTOR_FORM,
          );
        },
        label: Text('Cadastrar'),
        icon: Icon(Icons.add_circle),
      ),
    );
  }
}
