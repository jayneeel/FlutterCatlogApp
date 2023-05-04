import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageURL = "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Jayneel Kanungo"),
                  accountEmail: Text("kanungojayneel@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageURL),
                  ),
                )),
            ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white),
              title: Text("Home",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,color: Colors.white),
              title: Text("Profile",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail,color: Colors.white),
              title: Text("Email Me",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}

