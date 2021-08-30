import 'package:agendamed/models/appointment.dart';
import 'package:agendamed/provider/appointments.dart';
import 'package:agendamed/views/appointment_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentCard extends StatelessWidget {
  late final Appointment appointment;

  AppointmentCard(this.appointment);

  @override
  Widget build(BuildContext context) {
    final Appointments appointments = Provider.of(context);
    final avatar = appointment.patient.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(appointment.patient.avatarUrl));
    return Card(
      elevation: 10,
      child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppointmentDetails()),
            );
          },
          onLongPress: () {
            appointments.remove(appointment);
          },
          leading: avatar,
          title: Text(
            "Paciente: " + appointment.patient.name,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            'Médico: ' +
                appointment.doctor.name +
                "\n" +
                'Data: ' +
                appointment.date,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          isThreeLine: true,
          trailing: Text(
            appointment.hour,
            style: TextStyle(fontSize: 30),
          )),
    );
  }
}
