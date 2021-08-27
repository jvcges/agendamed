import 'package:agendamed/models/user.dart';
import 'package:flutter/material.dart';

class UsersCard extends StatelessWidget {
  late final User user;

  UsersCard(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return Card(
      elevation: 10,
      child: ListTile(
        leading: avatar,
        title: Text(
          user.name,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          'Email: ' + user.email,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                color: Colors.blueGrey,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.indigo.shade600,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
