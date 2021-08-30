import 'dart:math';
import 'package:agendamed/data/data_patient.dart';
import 'package:agendamed/models/patient.dart';
import 'package:flutter/cupertino.dart';

class Patients with ChangeNotifier {
  Map<String, Patient> _items = {...DATA_PATIENTS};

  List<Patient> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Patient byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Patient patient) {
    if (patient.name == '' || patient.cpf == '') {
      return;
    }
    //alterar
    if (_items.containsKey(patient.id.toString())) {
      _items.update(patient.id.toString(), (_) => patient);
    } else {
      //cadastrar
      final id = Random().nextInt(999999);
      _items.putIfAbsent(
          id.toString(),
          () => Patient(
                id: id,
                name: patient.name,
                cpf: patient.cpf,
                rg: patient.rg,
                phone: patient.phone,
                avatarUrl: patient.avatarUrl,
              ));
    }
    notifyListeners();
  }

  void remove(Patient patient) {
    _items.remove(patient.id.toString());
    notifyListeners();
  }
}
