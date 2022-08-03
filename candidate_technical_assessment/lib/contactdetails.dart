import 'package:flutter/material.dart';

import 'contact.dart';

class ContactDetails extends StatefulWidget {
  final User user;
  const ContactDetails({Key? key, required this.user}) : super(key: key);

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contact Details'),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Text(widget.user.user),
            Text(widget.user.phone),
            Text(widget.user.checkin),
          ],
        )),
      ),
    );
  }
}
