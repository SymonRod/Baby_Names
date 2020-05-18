import 'package:flutter/material.dart';


class SideNavBar extends StatelessWidget  {

  @override 
  Widget build(BuildContext context)  {
    return new Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        //Oggetti nella sidebar
        children: <Widget>[
          ListTile(
            title: Text('Impostazioni'),
            onTap: () {

            },
            ),
        ],
      ),
    );
  }
}