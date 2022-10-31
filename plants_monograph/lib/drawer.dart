import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sliver.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        // padding: EdgeInsets.zero,
        children: [
          // DrawerHeader
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage("https://s.inyourpocket.com/gallery/226052.jpg"),
              fit: BoxFit.cover,
            )),
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.2),
                ])),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text('Mono Book', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  ),
                )),
          ),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(fontSize: 20),
            ),
            trailing: Icon(
              FontAwesomeIcons.home,
              color: Colors.red,
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomeScreen()),
              // );
              Navigator.pushReplacementNamed(
                context,
                '/',
              );
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Favorite', style: TextStyle(fontSize: 20)),
            trailing: Icon(
              Icons.favorite,
              color: Colors.green,
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: Text('Logout', style: TextStyle(fontSize: 20)),
            trailing: Icon(
              Icons.logout,
              color: Colors.pink,
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
