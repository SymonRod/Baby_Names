import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'GradientAppBar.dart';
import 'HomePageBody.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return new Scaffold(
      backgroundColor: Colors.grey[900],
        body: new Column(
          children: <Widget>[
            //GradientAppBar("Cerca Nomi"),
            HomePageBody(),
      ],
    ));
  }
}
