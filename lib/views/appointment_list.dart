import 'package:agendamed/provider/appointments.dart';
import 'package:agendamed/routes/app.routes.dart';
import 'package:agendamed/views/consome_api.dart';
import 'package:agendamed/views/patient_list.dart';
import 'package:agendamed/views/user_list.dart';
import 'package:agendamed/widgets/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'doctor_list.dart';

class AppointmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Appointments appointments = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultas'),
      ),
      body: ListView.builder(
        itemCount: appointments.count,
        itemBuilder: (context, index) =>
            AppointmentCard(appointments.byIndex(index)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.APPOINTMENT_FORM,
          );
        },
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
                  MaterialPageRoute(builder: (context) => ConsomeAPI()),
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
