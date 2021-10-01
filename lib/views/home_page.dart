import 'dart:async';

import 'package:agendamed/main.dart';
import 'package:agendamed/models/user.dart';
import 'package:agendamed/provider/users.dart';
import 'package:agendamed/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'appointment_list.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  StreamController _dataStream = StreamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child: StreamBuilder(
            stream: _dataStream.stream,
            initialData: "Logando",
            builder: (context, snapshot) {
              if (snapshot.data == "Logando") {
                return Home(_dataStream);
              } else {
                return LinearProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  String email = "", senha = "";
  StreamController _dataStream;

  Home(this._dataStream);

  @override
  Widget build(BuildContext context) {
    //final Users users = Provider.of(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 180, left: 40, right: 40),
        color: Colors.blueGrey.shade300,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("assets/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                //border: OutlineInputBorder(),
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              validator: (valor) {
                if (valor!.isNotEmpty) {
                  return null;
                } else {
                  return "Campo em branco";
                }
              },
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _senhaController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              validator: (valor) {
                if (valor!.isNotEmpty) {
                  return null;
                } else {
                  return "Campo em branco";
                }
              },
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.bottomRight,
              //child: Text("Recuperar Senha"),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Colors.blueGrey.shade900,
                    Colors.blueGrey.shade700,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(

                  onPressed: () async {
                    _dataStream.add("Logando");
                    await Future.delayed(
                      Duration(seconds: 1),
                    );
                    _dataStream.add("Login");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppointmentList()));

                    /*if (_formKey.currentState!.validate()) {
                      setState(() {});
                      email = _emailController.text;
                      senha = _senhaController.text;

                    } else {}

                     */
                  },
                  child: Text(
                    "Logar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
