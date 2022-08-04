import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:candidate_technical_assessment/addcontact.dart';
import 'package:candidate_technical_assessment/contact.dart';
import 'package:candidate_technical_assessment/contactdetails.dart';
import 'package:candidate_technical_assessment/SpriteAnimation.dart';
import 'package:flame/game.dart';
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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Container(
                height: screenHeight / 16,
                width: screenWidth / 2,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/vimigo_tech.png'),
                        fit: BoxFit.fitHeight))),
          ),
        ),
        body: Stack(
          children: [
            Column(
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
                    childAspectRatio: 4,
                    children: List.generate(
                        contactdata.length,
                        (index) => Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: InkWell(
                                onTap: () => _contactDetails(index),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          child: Container(
                                              height: screenHeight / 5,
                                              width: screenWidth / 5,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/vimigo-logo.png'),
                                                      fit: BoxFit.contain))),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            contactdata[index]['user'],
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.phone),
                                              Text(
                                                " " +
                                                    contactdata[index]['phone'],
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.calendar_today),
                                              Text(
                                                " " +
                                                    DateFormat(
                                                            'dd MMM yyyy hh:mm a')
                                                        .format(DateTime.parse(
                                                            contactdata[index]
                                                                ['check_in'])),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                  ),
                )
              ],
            ),
            Positioned(
              right: screenWidth / 10,
              bottom: screenHeight / 7,
              child: ClipOval(
                child: Material(
                  color: Colors.orangeAccent,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const AddContact()));
                    },
                    child: const SizedBox(
                        width: 56, height: 56, child: Icon(Icons.add)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 1, width: 1, child: GameWidget(game: MyGame())),
          ],
        ));
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

  _contactDetails(int index) {
    User _userData = User(
        user: contactdata[index]['user'],
        phone: contactdata[index]['phone'],
        checkin: contactdata[index]['check_in']);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ContactDetails(
                  user: _userData,
                )));
  }
}
