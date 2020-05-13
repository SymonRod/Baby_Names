import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 60.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: Center(
        child: Text(
          this.title,
          textDirection: TextDirection.ltr,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              fontSize: 36),
        ),
      ),
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
            Color.fromRGBO(87, 87, 87, 1),
            Color.fromRGBO(46, 46, 46, 1),
          ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              tileMode: TileMode.clamp)),
    );
  }
}
