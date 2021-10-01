import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppointmentDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
      ),
      body: FutureBuilder<List>(
        future: getPost(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      "Paciente: " + "${snapshot.data![index]["patient"]}"),
                  subtitle: Text("Plano de Saúde: " +
                      "${snapshot.data![index]["insurance"]}" +
                      '\n' +
                      "Nova Consulta? " +
                      "${snapshot.data![index]["newappointment"]}"),
                  isThreeLine: true,
                );
              });
        },
      ),
    );
  }

  Future<List> getPost() async {
    var url =
        Uri.parse('https://my-json-server.typicode.com/jvcges/fakeAPI/posts');
    var result = await http.get(url);
    return jsonDecode(result.body);
  }
}
