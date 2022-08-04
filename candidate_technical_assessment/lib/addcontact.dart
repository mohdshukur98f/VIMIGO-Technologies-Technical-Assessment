import 'package:candidate_technical_assessment/home.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  String server = "https://seriouslaa.com/vimigoTech/php";
  late double screenHeight, screenWidth;
  final _formKey = GlobalKey<FormState>();

  TextEditingController userEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController checkinEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New Contact'),
        ),
        body: Form(
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
                    const Text("Contact Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter something!';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "Enter contact name here",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.orangeAccent, width: 2)),
                                border: OutlineInputBorder(),
                              ),
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              minLines: null,
                              maxLines: null,
                              controller: userEditingController)),
                    ),
                    const SizedBox(height: 10),
                    const Text("Phone Number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter something!';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Enter phone number here",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.orangeAccent, width: 2)),
                            border: OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.phone,
                          minLines: null,
                          maxLines: null,
                          controller: phoneEditingController,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      width: screenWidth / 1.2,
                      child: MaterialButton(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Text('Add New Contact',
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        color: Colors.orange[300],
                        onPressed: _register,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  _register() {
    String user = userEditingController.text;
    String phone = phoneEditingController.text;

    if (_formKey.currentState!.validate()) {
      http.post(Uri.parse(server + "/addcontact.php"), body: {
        "user": user,
        "phone": phone,
      }).then((res) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => const Home()));
        Toast.show("New Contact Added", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }).catchError((err) {
        if (kDebugMode) {
          print(err);
        }
      });
    }
  }
}
