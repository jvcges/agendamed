import 'package:agendamed/models/user.dart';
import 'package:flutter/material.dart';
import 'package:agendamed/models/doctor.dart';

class DoctorCard extends StatelessWidget {
  late final Doctor doctor;

  DoctorCard(this.doctor);

  @override
  Widget build(BuildContext context) {
    final avatar = doctor.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(doctor.avatarUrl));
    return Card(
      elevation: 10,
      child: ListTile(
        leading: avatar,
        title: Text(
          doctor.name,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          'CRM: ' + doctor.crm,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                color: Colors.deepPurple,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.purpleAccent,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
