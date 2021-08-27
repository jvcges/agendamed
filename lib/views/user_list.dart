import 'package:agendamed/data/data_doctor.dart';
import 'package:agendamed/data/data_users.dart';
import 'package:agendamed/widgets/user_card.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = {...DATA_USERS};
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) =>
            UsersCard(users.values.elementAt(index)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Cadastrar'),
        icon: Icon(Icons.add_circle),
      ),
    );
  }
}
