import 'package:agendamed/models/appointment.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  late final Appointment appointment;

  AppointmentCard(this.appointment);

  @override
  Widget build(BuildContext context) {
    final avatar = appointment.doctor.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(appointment.doctor.avatarUrl));
    return Card(
      elevation: 10,
      child: ListTile(
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
