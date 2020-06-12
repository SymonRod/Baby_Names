import 'package:flutter/material.dart';

class SideNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: Container(
      color: Colors.grey[900],
      child: ListView(
        //Oggetti nel Drawer
        children: <Widget>[
          DrawerHeader(
              child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Baby Names',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Abel',
                  fontSize: 30,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Abel',
                fontSize: 20,
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
                fontFamily: 'Abel',
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/home/setting');
            },
          ),
        ],
      ),
    ));
  }
}
