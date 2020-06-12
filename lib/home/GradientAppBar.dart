import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 60.0; 

  GradientAppBar({this.title});


  @override
  Widget build(BuildContext context) {

    return new 
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    color: Color(0xFF00BBFF),
                    iconSize: 30,
                    icon: Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  //color: Colors.white,
                  child: Text(
                    this.title,
                    style: TextStyle(
                      fontFamily: 'Abel',
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Container(
                  //color: Colors.red,

                ),
              )
            ],
          ),
    );
  }
}
