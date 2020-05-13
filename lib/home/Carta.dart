import 'package:flutter/material.dart';

class Carta extends StatelessWidget {

  final Text title;
  final String image;
  final Color color1;
  final Color color2;

  Carta({Key key, this.title, this.color1, this.color2, this.image}) : super (key : key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 24.0,
      ),
      child: new Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: title,
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.topLeft,
                ),
                Container(
                  child: Image.network(image),
                  alignment: Alignment.centerRight,
                  height: 60,
                  margin: EdgeInsets.only(right: 20),
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
              ),
            height: 100,
            width: MediaQuery
            .of(context)
            .size
            .width,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(8.0),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: new Offset(0.0, 10.0)
                ),
              ],
              gradient: new LinearGradient(
                  colors: [
                    this.color1,
                    this.color2,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.5, 0.0),
                  tileMode: TileMode.clamp
                ),
            ),
          ),
        ],
      ),
    );
  }
}