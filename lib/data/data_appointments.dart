import 'package:agendamed/models/appointment.dart';

import 'data_doctor.dart';
import 'data_patient.dart';

final doctors = {...DATA_DOCTORS};
final patients = {...DATA_PATIENTS};

var DATA_APPOINTMENTS = {
  '1': Appointment(
      id: 1,
      patient: patients.values.elementAt(1),
      doctor: doctors.values.elementAt(1),
      date: "27/08/2021",
      hour: "10:00",
      insurance: "Unimed",
      newAppointment: true),
  '2': Appointment(
      id: 2,
      patient: patients.values.elementAt(2),
      doctor: doctors.values.elementAt(2),
      date: "27/08/2021",
      hour: "12:00",
      insurance: "FUSEX",
      newAppointment: true),
  '3': Appointment(
      id: 3,
      patient: patients.values.elementAt(0),
      doctor: doctors.values.elementAt(0),
      date: "27/08/2021",
      hour: "15:00",
      insurance: "CABERGS",
      newAppointment: true)
};
