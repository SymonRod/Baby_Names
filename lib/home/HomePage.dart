import 'package:babynames/home/GradientAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:babynames/home/HomePageBody.dart';
import 'package:babynames/home/SideNavBar.dart';

class HomePage extends StatelessWidget {
  final Widget body;

  HomePage({this.body});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return new SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[900],
            drawer: SideNavBar(),
            body: new Column(
              children: <Widget>[
                GradientAppBar(
                  title: 'Baby Names',
                ),
                this.body,
              ],
            )));
  }
}
