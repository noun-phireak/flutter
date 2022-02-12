import 'package:challenge/screens/bottom_nav.dart';
import 'package:challenge/screens/drawer.dart';
import 'package:challenge/screens/list_activities.dart';
import 'package:challenge/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageProvider(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("21 Day"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child:  StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("list").snapshots(),
          builder: (context, snapshot) {
            if(snapshot.hasError){
               return const Center(
                child: Text(
              "Something Went wrong",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ));
            }
            else if(snapshot.hasData || snapshot.data != null){
              return GridView.builder(
                itemCount: snapshot.data?.docs.length,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
      ), 
                itemBuilder: (context, index){
                  QueryDocumentSnapshot<Object?>? documentSnapshot =
                              snapshot.data?.docs[index];
                              return  ListActivities(
                                name: (documentSnapshot != null)
                                  ? (documentSnapshot['content'])
                                  : "",
                                ImgURL: (documentSnapshot != null)
                                  ? (documentSnapshot['image'])
                                  : "",  
                              );
                }
                );
            }
             return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        },        
        ),
      ),
      bottomNavigationBar: const BottomNav(),
      drawer: const MyDrawer(),
    );
  }
}

class PageProvider extends StatelessWidget {
  const PageProvider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const Home();
          }
          else{
            return const Login();
          }
        },
      ),
    );
  }
}
//  title: "21 Days", home: MyDrawer()