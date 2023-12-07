// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<HomePage> {
//   TextEditingController nameC = TextEditingController();
//   TextEditingController jobC = TextEditingController();

//   String hasilResponse = "Belum ada data";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("HTTP Request Put / Patch"),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(20),
//         children: [
//           TextField(
//             controller: nameC,
//             autocorrect: false,
//             keyboardType: TextInputType.text,
//             decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                 labelText: "Name"),
//           ),
//           SizedBox(
//             height: 12,
//           ),
//           TextField(
//             controller: jobC,
//             autocorrect: false,
//             keyboardType: TextInputType.text,
//             decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                 labelText: "Job"),
//           ),
//           SizedBox(
//             height: 12,
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 var myresponse = await http.put(
//                     Uri.parse("https://reqres.in/api/users/2"),
//                     body: {"name": nameC.text, "job": jobC.text});

//                 Map<String, dynamic> data =
//                     jsonDecode(myresponse.body) as Map<String, dynamic>;
//                 setState(() {
//                   hasilResponse = "${data['name']} - ${data['job']}";
//                 });
//               },
//               style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12))),
//               child: Text("Submit")),
//           SizedBox(
//             height: 50,
//           ),
//           Divider(
//             color: Colors.black,
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(hasilResponse),
//         ],
//       ),
//     );
//   }
// }
