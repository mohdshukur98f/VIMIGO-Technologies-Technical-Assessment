import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'contact.dart';

class ContactDetails extends StatefulWidget {
  final User user;
  const ContactDetails({Key? key, required this.user}) : super(key: key);

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  String server = "https://seriouslaa.com/vimigoTech/php";
  late double screenHeight, screenWidth;
  final _formKey = GlobalKey<FormState>();
  bool editContact = false;

  TextEditingController userEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController checkinEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
                height: screenHeight / 10,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/vimigo-logo.png'),
                        fit: BoxFit.contain))),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Contact Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                            initialValue: "   " + widget.user.user,
                            enabled: editContact,
                            textCapitalization: TextCapitalization.characters,
                            style: const TextStyle(fontSize: 18),
                            decoration: const InputDecoration(
                              prefix: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Phone Number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                            initialValue: "   " + widget.user.phone,
                            enabled: editContact,
                            textCapitalization: TextCapitalization.characters,
                            style: const TextStyle(fontSize: 18),
                            decoration: const InputDecoration(
                              prefix: Icon(Icons.phone_android),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Check In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                            enabled: editContact,
                            initialValue: "   " +
                                DateFormat('dd MMM yyyy hh:mm a').format(
                                    DateTime.parse(widget.user.checkin)),
                            style: const TextStyle(fontSize: 18),
                            decoration: const InputDecoration(
                              prefix: Icon(Icons.calendar_today),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
