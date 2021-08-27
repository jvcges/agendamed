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
}
