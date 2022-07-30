import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late double screenHeight, screenWidth;
  String server = "https://seriouslaa.com/vimigoTech/php";

  List contactdata = [];

  @override
  void initState() {
    super.initState();
    _loadcontact();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Text(contactdata[1]["user"]),
        ),
      ),
    );
  }

  void _loadcontact() async {
    await http.post(Uri.parse(server + "/load_user.php"), body: {}).then((res) {
      if (res.body == "nodata") {
      } else {
        setState(() {
          var extractdata = json.decode(res.body);
          contactdata = extractdata["contact"];
          // cartquantity = widget.user.quantity;
        });
      }
    }).catchError((err) {});
  }
}
