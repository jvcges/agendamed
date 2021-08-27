import 'dart:math';

import 'package:agendamed/data/data_doctor.dart';
import 'package:agendamed/models/doctor.dart';
import 'package:flutter/cupertino.dart';

class Doctors with ChangeNotifier {
  Map<String, Doctor> _items = {...DATA_DOCTORS};

  List<Doctor> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Doctor byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Doctor doctor) {
    final id = Random().nextInt(999999);
    _items.putIfAbsent(
        id.toString(),
        () => Doctor(
              id: id,
              name: doctor.name,
              crm: doctor.crm,
              avatarUrl: doctor.avatarUrl,
            ));
    notifyListeners();
  }
}
