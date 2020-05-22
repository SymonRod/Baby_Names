import 'package:flutter/material.dart';


class SideNavBar extends StatelessWidget  {

  @override 
  Widget build(BuildContext context)  {
    return new Drawer(
      child: Container(
        color: Colors.grey[900],
        child: ListView(
          padding: EdgeInsets.all(10),
          //Oggetti nel Drawer
          children: <Widget>[
            ListTile(
              title: Text('Impostazioni'),
              
              onTap: () {

              },
              ),
          ],
        ),
      )
    );
  }
}