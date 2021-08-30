import 'dart:math';
import 'package:agendamed/data/data_users.dart';
import 'package:agendamed/models/user.dart';
import 'package:flutter/cupertino.dart';

class Users with ChangeNotifier {
  Map<String, User> _items = {...DATA_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user.password == '' || user.email == '') {
      return;
    }
    //alterar
    if (_items.containsKey(user.id.toString())) {
      _items.update(user.id.toString(), (_) => user);
    } else {
      //cadastrar
      final id = Random().nextInt(999999);
      _items.putIfAbsent(
        id.toString(),
        () => User(
            id: id,
            name: user.name,
            email: user.email,
            password: user.password,
            avatarUrl: user.avatarUrl),
      );
    }
    notifyListeners();
  }

  void remove(User user) {
    _items.remove(user.id.toString());
    notifyListeners();
  }
}
