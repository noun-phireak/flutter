import 'package:challenge/constant.dart';
import 'package:challenge/models/api_response.dart';
import 'package:challenge/services/user_service.dart';
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

  void _loginUser() async {
    ApiResponse response = await login(textPhone.text, textPassword.text);
    if (response.error == null) {
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('{$response.error}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formkey,
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            TextFormField(
                keyboardType: TextInputType.phone,
                controller: textPhone,
                validator: (value) => value!.isEmpty ? 'Invalid Email' : null,
                decoration: keyboardInput("Phone")),
            SizedBox(
              height: 15,
            ),
            TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Required at least 6 chars' : null,
                decoration: keyboardInput("Password")),
            SizedBox(
              height: 15,
            ),
            TextButton(
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.blue),
                padding: MaterialStateProperty.resolveWith(
                    (states) => EdgeInsets.symmetric(vertical: 10)),
              ),
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  _loginUser();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
