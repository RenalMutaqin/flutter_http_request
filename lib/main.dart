import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_request/models/user.dart';
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
  List<UserModel> allUser = [];
  Future getAllUser() async {
    try {
      var response =
          await http.get(Uri.parse("https://reqres.in/api/users?page=1"));
      List data = (jsonDecode(response.body) as Map<String, dynamic>)["data"];
      data.forEach((element) {
        allUser.add(userModelFromJson(element));
      });
      print(allUser);
    } catch (e) {
      //Jika terjadi kesalahan
      print("Terjadi kesalahan");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Future Builder"),
        ),
        // body: Center(
        //   child: ElevatedButton(
        //       onPressed: () async {
        //         //get data url api
        //         var response = await http
        //             .get(Uri.parse("https://reqres.in/api/users?page=2"));
        //         List data =
        //             (jsonDecode(response.body) as Map<String, dynamic>)["data"];
        //         // print(data[0] as Map<String, dynamic>);
        //         data.forEach((element) {
        //           Map<String, dynamic> user = element;
        //           print(user["email"]);
        //         });
        //       },
        //       child: Text("Klik Button")),
        // ),

        //mengambil data tanpa di klik
        body: FutureBuilder(
            future: getAllUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Loading..."),
                );
              } else {
                if (allUser.length == 0) {
                  return Center(
                    child: Text("Tidak ada data"),
                  );
                } else {
                  return ListView.builder(
                    itemCount: allUser.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(allUser[index].avatar),
                      ),
                      title: Text(
                          "${allUser[index].firstName} ${allUser[index].lastName}"),
                      subtitle: Text("${allUser[index].email}"),
                    ),
                  );
                }
              }
            }));
  }
}
