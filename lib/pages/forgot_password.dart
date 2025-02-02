import 'dart:ffi';

import 'package:flutter/material.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({Key? key}) : super(key: key);

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  final TextEditingController _controllerEmail = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Icon(Icons.arrow_back),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FORGET PASSWORD",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 5,
                width: 60,
                color: Color.fromRGBO(241, 0, 134, 1),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: TextField(
            controller: _controllerEmail,
            decoration: InputDecoration(
              hintText: "Email",
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30, left: 30),
          child: Row(
            children: [
              Expanded(
                  child: FlatButton(
                color: Color.fromRGBO(241, 0, 134, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  ForgetPass();
                },
                child: Text(
                  "Done",
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              ))
            ],
          ),
        ),
      ],
    ));
  }

  ForgetPass() {
    String emailfield = _controllerEmail.text;
    if (emailfield.isNotEmpty) {
      alert(emailfield);
    }
  }

  Future<Future<Void?>> alert(email) async {
    return showDialog<Void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("forget password"),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[Text("The verify code sent to $email")],
            )),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
