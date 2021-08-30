import 'package:agendamed/models/patient.dart';
import 'package:agendamed/provider/patients.dart';
import 'package:agendamed/routes/app.routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientsCard extends StatelessWidget {
  late final Patient patient;

  PatientsCard(this.patient);

  @override
  Widget build(BuildContext context) {
    final Patients patients = Provider.of(context);
    final avatar = patient.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(patient.avatarUrl));
    return Card(
      elevation: 10,
      child: ListTile(
        leading: avatar,
        title: Text(
          patient.name,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          'Telefone: ' + patient.phone + '\n' + 'CPF' + patient.cpf,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        isThreeLine: true,
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.PATIENT_FORM,
                    arguments: patient,
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
                            title: Text('Excluir Paciente'),
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
                                  patients.remove(patient);
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
