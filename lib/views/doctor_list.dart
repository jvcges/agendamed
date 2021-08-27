import 'package:agendamed/data/data_doctor.dart';
import 'package:agendamed/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class DoctorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctors = {...DATA_DOCTORS};
    return Scaffold(
      appBar: AppBar(
        title: Text('Médicos'),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) =>
            DoctorCard(doctors.values.elementAt(index)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
