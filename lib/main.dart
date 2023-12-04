import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String id;
  late String email;
  late String name;
  @override
  void initState() {
    id = "";
    email = "";
    name = "";
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP Request Get"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ID : $id",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Email : $email",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Nama : $name",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                var response =
                    await http.get(Uri.parse("https://reqres.in/api/users/2"));
                if (response.statusCode == 200) {
                  //berhasil get data
                  print("Berhasil get data");
                  var data = jsonDecode(response.body) as Map<String, dynamic>;
                  print(data["data"]);
                  setState(() {
                    id = data["data"]["id"].toString();
                    email = data["data"]["email"].toString();
                    name =
                        "${data["data"]["first_name"]} ${data["data"]["last_name"]}";
                  });
                } else {
                  print("Error ${response.statusCode}");
                }
              },
              child: Text("Get Data"),
            ),
          ],
        ),
      ),
    );
  }
}
