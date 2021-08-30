import 'package:agendamed/provider/users.dart';
import 'package:agendamed/routes/app.routes.dart';
import 'package:agendamed/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (context, index) => UsersCard(users.byIndex(index)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.USER_FORM,
          );
        },
        label: Text('Cadastrar'),
        icon: Icon(Icons.add_circle),
      ),
    );
  }
}
