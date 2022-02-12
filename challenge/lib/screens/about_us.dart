import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        // color: Colors.red,
        height: 100,
        width: 200,
        child: Card(),
      ),
    );
  }
}
