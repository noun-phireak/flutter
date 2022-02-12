// ignore_for_file: non_constant_identifier_names

import 'package:challenge/constant.dart';
import 'package:challenge/models/api_response.dart';
import 'package:challenge/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController textPhone = TextEditingController();
  TextEditingController textPassword = TextEditingController();

  String email = "";
  String password = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: textPhone,
                validator: (value) => value!.isEmpty ? 'Invalid Email' : null,
                decoration: keyboardInput("Email"),
                onChanged: (Value){
                  setState(() {
                    email = Value.toString();
                  });
                },),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Required at least 6 chars' : null,
                decoration: keyboardInput("Password"),
                onChanged: (pass){
                  setState(() {
                    password = pass.toString();
                  });
                },
                ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.blue),
                padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.symmetric(vertical: 10)),
              ),
              onPressed: () {
                if (formkey.currentState!.validate()) {
                 Login();
                }
              },
            )
          ],
        ),
      ),
    );
  }
  Future Login() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: password);
  }
}
