import 'dart:math';
import 'package:agendamed/data/data_appointments.dart';
import 'package:agendamed/models/appointment.dart';
import 'package:flutter/cupertino.dart';

class Appointments with ChangeNotifier {
  Map<String, Appointment> _items = {...DATA_APPOINTMENTS};

  List<Appointment> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Appointment byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Appointment appointment) {
    //alterar
    if (_items.containsKey(appointment.id.toString())) {
      _items.update(appointment.id.toString(), (_) => appointment);
    } else {
      //cadastrar
      final id = Random().nextInt(999999);
      _items.putIfAbsent(
        id.toString(),
        () => Appointment(
          id: id,
          patient: appointment.patient,
          doctor: appointment.doctor,
          date: appointment.date,
          hour: appointment.hour,
          insurance: appointment.insurance,
          newAppointment: appointment.newAppointment,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Appointment appointment) {
    _items.remove(appointment.id.toString());
    notifyListeners();
  }
}
