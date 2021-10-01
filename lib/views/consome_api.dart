import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsomeAPI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consome API"),
      ),
      body: FutureBuilder<List>(
        future: getPost(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: LinearProgressIndicator(),
            );
          }
          ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text("${snapshot.data[index]["name"]}"),
                

              )
            }

          )
        },
      ),
    );
  }

  Future<List> getPost() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var result = await http.get(url);
    return jsonDecode(result.body);
  }
}
