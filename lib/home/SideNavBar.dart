import 'package:flutter/material.dart';


class SideNavBar extends StatelessWidget  {

  @override 
  Widget build(BuildContext context)  {
    return new Drawer(
      child: Container(
        color: Colors.grey[900],
        child: ListView(
          //Oggetti nel Drawer
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: Text(
                'Impostazioni',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/home/setting');
              },
            ),
          ],
        ),
      )
    );
  }
}