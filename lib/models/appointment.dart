import 'package:agendamed/models/doctor.dart';
import 'package:agendamed/models/patient.dart';
import 'package:flutter/material.dart';

class Appointment {
  final int id;
  final Patient patient;
  final Doctor doctor;
  final String date;
  final String hour;
  final String insurance;
  final bool newAppointment;

  const Appointment(
      {required this.id,
      required this.patient,
      required this.doctor,
      required this.date,
      required this.hour,
      required this.insurance,
      required this.newAppointment});
}
