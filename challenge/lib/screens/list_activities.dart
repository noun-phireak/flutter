// ignore_for_file: must_be_immutable, non_constant_identifier_names
import 'package:challenge/screens/activity.dart';
import 'package:challenge/screens/notification.dart';
import 'package:flutter/material.dart';

class ListActivities extends StatefulWidget {
    String name;
    String ImgURL;
  ListActivities({Key? key, required this.name, required this.ImgURL}) : super(key: key);

  @override
  State<ListActivities> createState() => _ListActivitiesState();
}

class _ListActivitiesState extends State<ListActivities> {
  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(3),
      child: GestureDetector(
        child: Card(
          elevation: 5,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image(image: NetworkImage(widget.ImgURL))),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(widget.name, style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 15),))
            ],
          ),
        ),
        onTap: (){
        setState(() {
           Navigator.push(context, MaterialPageRoute(builder: (context) => Activity(name: widget.name)));
        });
        },
      ),
    );
}
}
