import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
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
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Vimigo'),
          ),
          body: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 1,
            childAspectRatio: 5,
            children: List.generate(
                contactdata.length,
                (index) => Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              contactdata[index]['user'],
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              contactdata[index]['phone'],
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              DateFormat('dd MMM yyyy hh:mm a').format(
                                  DateTime.parse(
                                      contactdata[index]['check_in'])),
                            ),
                          ],
                        ),
                      ),
                    )),
          )),
    );
  }

  void _loadcontact() async {
    await http.post(Uri.parse(server + "/load_user.php"), body: {}).then((res) {
      if (res.body == "nodata") {
      } else {
        setState(() {
          var extractdata = json.decode(res.body);
          contactdata = extractdata["contact"];
        });
      }
    }).catchError((err) {});
  }
}
