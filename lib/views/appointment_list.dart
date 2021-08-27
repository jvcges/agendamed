import 'package:agendamed/data/data_doctor.dart';
import 'package:agendamed/data/data_patient.dart';
import 'package:agendamed/data/data_users.dart';
import 'package:agendamed/models/appointment.dart';
import 'package:agendamed/views/patient_list.dart';
import 'package:agendamed/views/user_list.dart';
import 'package:agendamed/widgets/appointment_card.dart';
import 'package:flutter/material.dart';

import 'doctor_list.dart';

class AppointmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctors = {...DATA_DOCTORS};
    final patients = {...DATA_PATIENTS};
    final users = {...DATA_USERS};
    final appointments = {
      '1': Appointment(
          id: 1,
          patient: patients.values.elementAt(1),
          doctor: doctors.values.elementAt(1),
          date: "27/08/2021",
          hour: "10:00",
          insurance: "Unimed",
          newAppointment: true),
      '2': Appointment(
          id: 2,
          patient: patients.values.elementAt(2),
          doctor: doctors.values.elementAt(2),
          date: "27/08/2021",
          hour: "12:00",
          insurance: "FUSEX",
          newAppointment: true),
      '3': Appointment(
          id: 3,
          patient: patients.values.elementAt(0),
          doctor: doctors.values.elementAt(0),
          date: "27/08/2021",
          hour: "15:00",
          insurance: "CABERGS",
          newAppointment: true)
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultas'),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) =>
            AppointmentCard(appointments.values.elementAt(index)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Cadastrar'),
        icon: Icon(Icons.add_circle),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              accountEmail: Text('joaogermain@gmail.com'),
              accountName: Text('João Victor Germain'),
              currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
            ),
            ListTile(
              title: const Text(
                'Médicos',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorList()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: const Text(
                'Pacientes',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PatientList()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: const Text(
                'Usuários',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserList()),
                );
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
