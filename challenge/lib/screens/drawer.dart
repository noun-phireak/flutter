import 'package:challenge/screens/about_us.dart';
import 'package:challenge/screens/notification.dart';
import 'package:challenge/screens/privacy.dart';
import 'package:challenge/screens/share.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key, child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              child: Text("Drawer Header")),
          ListTile(
            leading: Icon(Icons.notifications),
            title: const Text("Notification"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notifications()));
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: const Text("Share"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Share()));
            },
          ),
          ListTile(
              leading: Icon(Icons.info),
              title: const Text("About Us"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              }),
          ListTile(
              leading: Icon(Icons.privacy_tip),
              title: const Text("Terms condition & Privacy"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Privacy()));
              })
        ],
      ),
    );
  }
}
