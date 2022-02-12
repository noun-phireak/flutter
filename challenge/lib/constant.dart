import 'package:flutter/material.dart';

const baseURL = 'htpp://localhost:800/api';
const loginURL = baseURL + 'auth/login';
const serverError = 'Server Error';
const uauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong';

InputDecoration keyboardInput(label) {
  return InputDecoration(
      labelText: label,
      contentPadding: EdgeInsets.all(10),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black)));
}

TextButton keyTextBottom(String label, Function onPressed) {
  return TextButton(
    child: Text(label, style: TextStyle(color: Colors.white)),
    style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.blue)),
    onPressed: () => onPressed(),
  );
}
