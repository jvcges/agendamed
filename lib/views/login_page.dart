import 'package:agendamed/models/user.dart';
import 'package:agendamed/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'appointment_list.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  String email = "", senha = "";

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
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
                  onPressed: () {
                    if (users.authenticate(User(
                            id: -1,
                            name: "",
                            email: _emailController.text,
                            password: _senhaController.text,
                            avatarUrl: "")) ==
                        true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppointmentList()));
                    } else {
                      print("Senha inkdnd");
                      // print(_emailController.text);
                      // print(_senhaController.text);
                    }
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
