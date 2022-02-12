import 'package:challenge/screens/bottom_nav.dart';
import 'package:challenge/screens/drawer.dart';
import 'package:challenge/screens/list_activities.dart';
import 'package:challenge/screens/loading.dart';
import 'package:challenge/screens/login.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("21 Day"),
        backgroundColor: Colors.cyan,
      ),
      body: const Center(
        child: ListActivities(),
      ),
      bottomNavigationBar: BottomNav(),
      drawer: MyDrawer(),
    );
  }
}
//  title: "21 Days", home: MyDrawer()