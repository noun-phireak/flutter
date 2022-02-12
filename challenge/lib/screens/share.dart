import 'package:flutter/material.dart';

class Share extends StatelessWidget {
  const Share({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share"),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        child: Text("Share"),
      ),
    );
  }
}
