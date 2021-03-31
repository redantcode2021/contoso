import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Text("Welcome User, \nLogin to your account"),
              ),
              Container(
                child: Text("Input Field"),
              ),
              Container(
                child: Text("Create New Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
