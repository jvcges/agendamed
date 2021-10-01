import 'dart:async';

import 'package:agendamed/provider/appointments.dart';
import 'package:agendamed/provider/doctors.dart';
import 'package:agendamed/provider/patients.dart';
import 'package:agendamed/provider/users.dart';
import 'package:agendamed/routes/app.routes.dart';
import 'package:agendamed/views/appointment_details.dart';
import 'package:agendamed/views/appointment_form.dart';
import 'package:agendamed/views/doctor_edit.dart';
import 'package:agendamed/views/doctor_form.dart';
import 'package:agendamed/views/home_page.dart';
import 'package:agendamed/views/login_page.dart';
import 'package:agendamed/views/patient_form.dart';
import 'package:agendamed/views/patient_edit.dart';
import 'package:agendamed/views/user_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StreamController _stream = StreamController();
    _stream.add("Login");

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Doctors(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Patients(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Appointments(),
        ),
      ],
      child: MaterialApp(
        title: 'AgendaMed',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          //AppRoutes.HOME_PAGE: (_) => HomePage(),
          AppRoutes.LOGIN: (_) => Login(),
          AppRoutes.DOCTOR_FORM: (_) => DoctorForm(),
          AppRoutes.PATIENT_FORM: (_) => PatientForm(),
          AppRoutes.USER_FORM: (_) => UserForm(),
          AppRoutes.APPOINTMENT_FORM: (_) => AppointmentForm(),
          AppRoutes.APPOINTMENT_DETAILS: (_) => AppointmentDetails(),
          AppRoutes.DOCTOR_EDIT: (_) => DoctorEdit(),
          AppRoutes.PATIENT_EDIT: (_) => PatientEdit(),
        },
      ),
    );
  }
}
