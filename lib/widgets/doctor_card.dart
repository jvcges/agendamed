import 'package:agendamed/provider/doctors.dart';
import 'package:agendamed/routes/app.routes.dart';
import 'package:flutter/material.dart';
import 'package:agendamed/models/doctor.dart';
import 'package:provider/provider.dart';

class DoctorCard extends StatelessWidget {
  late final Doctor doctor;

  DoctorCard(this.doctor);

  @override
  Widget build(BuildContext context) {
    final Doctors doctors = Provider.of(context);
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
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.DOCTOR_EDIT,
                    arguments: doctor,
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.indigo.shade600,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text('Excluir Médico'),
                            content: Text('Você tem certeza?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Não'),
                              ),
                              TextButton(
                                onPressed: () {
                                  doctors.remove(doctor);
                                  Navigator.of(context).pop();
                                },
                                child: Text('Sim'),
                              )
                            ],
                          ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
