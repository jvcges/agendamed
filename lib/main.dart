import 'package:agendamed/provider/doctors.dart';
import 'package:agendamed/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Doctors(),
        ),
      ],
      child: MaterialApp(
        title: 'AgendaMed',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
