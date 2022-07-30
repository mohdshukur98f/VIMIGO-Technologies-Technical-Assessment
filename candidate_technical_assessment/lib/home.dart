import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  late double screenHeight, screenWidth;
  String server = "https://seriouslaa.com/vimigoTech/php";
  final TextEditingController _searchController = TextEditingController();

  List contactdata = [];

  @override
  void initState() {
    super.initState();
    _loadcontact();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Vimigo'),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(8.0, screenHeight / 30, 8, 10),
                child: SizedBox(
                  width: screenWidth / 1.1,
                  child: TextField(
                    onChanged: (value) =>
                        _sortItembyName(_searchController.text),
                    cursorColor: Colors.white,
                    controller: _searchController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: "Find Contact",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                ),
              )
            ],
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

  _sortItembyName(String text) {
    try {
      http
          .post(Uri.parse(server + "/load_user.php"), body: {
            "search": _searchController.text,
          })
          .timeout(const Duration(seconds: 4))
          .then((res) {
            if (res.body == "nodata") {
              Toast.show("Search not found", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
            }

            setState(() {
              var extractdata = json.decode(res.body);
              contactdata = extractdata["contact"];

              // pr.hide();
            });
          })
          .catchError((err) {
            // pr.hide();
          });
      // pr.hide();
    } on TimeoutException catch (_) {
      Toast.show("Time out", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } on SocketException catch (_) {
      Toast.show("Time out", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } catch (e) {
      Toast.show("Error", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }
}
